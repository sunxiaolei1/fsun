package com.fsun.common.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.fsun.common.dto.CellRegionDto;
import com.fsun.common.dto.ColumnDto;

/**
 * 
 * <p>
 * Title: Excel导出/入工具类
 * </p>
 * 
 * <p>
 * Description:
 * </p>
 * 
 * @author
 * 
 * @date 2017年11月22日
 */
public class ExcelUtil {

	/***
	 * 表头行开始位置
	 */
	private static final int HEAD_START_POSITION = 0;

	/***
	 * 文本行开始位置
	 */
	private static final int CONTENT_START_POSITION = 1;
	
	/**
	 * @MethodName : listToExcel
	 * @Description : 导出Excel（可以导出到本地文件系统，也可以导出到浏览器，可自定义工作表大小）
	 * @param list 数据源
	 * @param fieldMap
	 *     类的英文属性和Excel中的中文列名的对应关系 如果需要的是引用对象的属性，则英文属性使用类似于EL表达式的格式
	 *     如：list中存放的都是student，student中又有college属性，而我们需要学院名称，则可以这样写
	 *     fieldMap.put("college.collegeName","学院名称")
	 * @param columnDtos 多表头单元格集合
	 * @param sheetName 工作表的名称
	 * @param sheetSize 每个工作表中记录的最大个数
	 * @param out 导出流
	 * @throws ExcelException
	 */
	public static <T> void listToExcel(List<T> list, LinkedHashMap<String, String> fieldMap, 
		List<ColumnDto> columnDtos, String sheetName, int sheetSize, 
			OutputStream out) throws Exception {
		if (list.size() == 0 || list == null) {			
			// throw new Exception("数据源中没有任何数据");
			HSSFWorkbook wb = new HSSFWorkbook();
			wb.write(out);
			wb.close();
		}
		if (sheetSize > 65535 || sheetSize < 1) {
			sheetSize = 65535;
		}
		// 创建工作簿并发送到OutputStream指定的地方
		try {
			HSSFWorkbook wb = new HSSFWorkbook();
			// 因为2003的Excel一个工作表最多可以有65536条记录，除去列头剩下65535条
			// 所以如果记录太多，需要放到多个工作表中，其实就是个分页的过程
			// 1.计算一共有多少个工作表
			double sheetNum = Math.ceil(list.size()/new Integer(sheetSize).doubleValue());
			// 2.创建相应的工作表，并向其中填充数据
			for (int i = 0; i < sheetNum; i++) {
				// 如果只有一个工作表的情况
				if (1 == sheetNum) {
					HSSFSheet sheet = wb.createSheet(sheetName);
					fillSheet(wb, sheet, list, fieldMap, columnDtos, 0, list.size() - 1);
					// 有多个工作表的情况
				} else {
					HSSFSheet sheet = wb.createSheet();
					wb.setSheetName(i, sheetName + i);
					// 获取开始索引和结束索引
					int firstIndex = i * sheetSize;
					int lastIndex = (i + 1) * sheetSize - 1 > list.size() - 1 ? list
							.size() - 1 : (i + 1) * sheetSize - 1;
					// 填充工作表
					fillSheet(wb, sheet, list, fieldMap, columnDtos, firstIndex, lastIndex);
				}
			}
			wb.write(out);
			wb.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("导出Excel失败");
		}		
	}

	/**
	 * @MethodName : listToExcel
	 * @Description : 导出Excel（可以导出到本地文件系统，也可以导出到浏览器，工作表大小为2003支持的最大值）
	 * @param list 数据源
	 * @param fieldMap 类的英文属性和Excel中的中文列名的对应关系
	 * @param columnDtos 多表头单元格集合
	 * @param out 导出流
	 * @throws ExcelException
	 */
	public static <T> void listToExcel(List<T> list, LinkedHashMap<String, String> fieldMap, 
			List<ColumnDto> columnDtos ,String sheetName, OutputStream out) throws Exception {
		listToExcel(list, fieldMap, columnDtos, sheetName, 65535, out);
	}
	
	/**
	 * @MethodName : listToExcel
	 * @Description : 导出Excel（导出到浏览器，可以自定义工作表的大小）
	 * @param list 数据源
	 * @param fieldMap 类的英文属性和Excel中的中文列名的对应关系
	 * @param columnDtos 多表头单元格集合
	 * @param sheetSize 每个工作表中记录的最大个数
	 * @param response 使用response可以导出到浏览器
	 * @throws ExcelException
	 */
	public static <T> void listToExcel(List<T> list, LinkedHashMap<String, String> fieldMap, 
		List<ColumnDto> columnDtos, String sheetName, int sheetSize, HttpServletResponse response) 
			throws Exception {
		// 设置默认文件名为当前时间：年月日时分秒
		String fileName = java.net.URLEncoder.encode(sheetName + "_"
				+ new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()).toString(), "UTF-8");
		// 设置response头信息
		response.reset();
		response.setContentType("application/vnd.ms-excel"); // 改成输出excel文件
		response.setHeader("Content-disposition", "attachment; filename=" + fileName + ".xls");
		// 创建工作簿并发送到浏览器
		try {
			OutputStream out = response.getOutputStream();
			listToExcel(list, fieldMap, columnDtos, sheetName, sheetSize, out);
		} catch (Exception e) {
			e.printStackTrace();
			// 如果是ExcelException，则直接抛出
			if (e instanceof Exception) {
				throw (Exception) e;
				// 否则将其它异常包装成ExcelException再抛出
			} else {
				throw new Exception("导出Excel失败");
			}
		}
	}
	
	/**
	 * @MethodName : listToExcel
	 * @Description : 导出Excel（导出到浏览器，工作表的大小是2003支持的最大值）
	 * @param list 数据源
	 * @param fieldMap 类的英文属性和Excel中的中文列名的对应关系
	 * @param columnDtos 多表头单元格集合
	 * @param response 使用response可以导出到浏览器
	 * @throws ExcelException
	 */
	public static <T> void listToExcel(List<T> list, LinkedHashMap<String, String> fieldMap, 
			List<ColumnDto> columnDtos, String sheetName, HttpServletResponse response) throws Exception {
		listToExcel(list, fieldMap, columnDtos, sheetName, 65535, response);
	}

	/**
	 * @MethodName : listToExcel
	 * @Description : 导出Excel（导出到浏览器，工作表的大小是2003支持的最大值）
	 * @param list 数据源
	 * @param fieldMap 类的英文属性和Excel中的中文列名的对应关系
	 * @param response 使用response可以导出到浏览器
	 * @throws ExcelException
	 */
	public static <T> void listToExcel(List<T> list, LinkedHashMap<String, String> fieldMap, String sheetName,
			HttpServletResponse response) throws Exception {
		listToExcel(list, fieldMap, null, sheetName, 65535, response);
	}

	/**
	 * 读取读取excel文件内容
	 * @param in 输入流
	 * @param extension 文件扩展名
	 * @param sheetIndex sheet索引
	 * @return
	 * @throws IOException
	 * @throws NumberFormatException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws ParseException
	 */
	public static <T> List<T> readExcel(InputStream in, String extension, int sheetIndex, Class<T> entityClass,
			LinkedHashMap<String, String> fieldMap, String[] uniqueFields) throws Exception {
		Workbook workbook = null;
		if (extension.equalsIgnoreCase(".xls")) {
			workbook = new HSSFWorkbook(in);
		} else if (extension.equalsIgnoreCase(".xlsx")) {
			workbook = new XSSFWorkbook(in);
		} else {
			throw new IOException("对不起，上传的文件扩展名必须为.xls或者.xlsx！");
		}
		return excelToList(workbook, sheetIndex, entityClass, fieldMap, uniqueFields);
	}

	/**
	 * @MethodName excelToList
	 * @Description 将Excel转化为List
	 * @param workbook Excel工作表
	 * @param sheetIndex 要导入的工作表序号
	 * @param entityClass List中对象的类型（Excel中的每一行都要转化为该类型的对象）
	 * @param fieldMap Excel中的中文列头和类的英文属性的对应关系Map
	 * @param uniqueFields 指定业务主键组合（即复合主键），这些列的组合不能重复
	 * @return ：List
	 * @throws ExcelException
	 */
	public static <T> List<T> excelToList(Workbook workbook, int sheetIndex,
			Class<T> entityClass, LinkedHashMap<String, String> fieldMap,
			String[] uniqueFields) throws Exception {
		// 定义要返回的list
		List<T> resultList = new ArrayList<T>();
		try {
			// 获取工作表
			Sheet sheet = workbook.getSheetAt(sheetIndex);
			// 获取工作表的有效行数
			int realRows = 0;
			for (int i = 0; i < sheet.getLastRowNum(); i++) {
				Row row = sheet.getRow(i);
				if (row != null) {
					int nullCols = 0;
					for (int j = 0; j < row.getPhysicalNumberOfCells(); j++) {
						Cell currentCell = row.getCell(j);
						if (currentCell == null) {
							nullCols++;
						}
					}
					if (nullCols == row.getPhysicalNumberOfCells()) {
						break;
					} else {
						realRows++;
					}
				}
			}
			// 如果Excel中没有数据则提示错误
			if (realRows <= 1) {
				throw new Exception("Excel文件中没有任何数据");
			}
			Row firstRow = sheet.getRow(0);
			List<String> excelFieldList = new ArrayList<String>();
			// 获取Excel中的列名
			for (int i = 0; i < firstRow.getPhysicalNumberOfCells(); i++) {
				excelFieldList.add(firstRow.getCell(i).getStringCellValue().trim());
			}
			// 判断需要的字段在Excel中是否都存在
			boolean isExist = true;
			for (String cnName : fieldMap.keySet()) {
				if (!excelFieldList.contains(cnName)) {
					isExist = false;
					break;
				}
			}
			// 如果有列名不存在，则抛出异常，提示错误
			if (!isExist) {
				throw new Exception("Excel中缺少必要的字段，或字段名称有误");
			}
			// 将列名和列号放入Map中,这样通过列名就可以拿到列号
			LinkedHashMap<String, Integer> colMap = new LinkedHashMap<String, Integer>();
			for (int i = 0; i < excelFieldList.size(); i++) {
				colMap.put(excelFieldList.get(i), sheet.getRow(i).getRowNum());
			}
			// 将sheet转换为list
			for (int i = 1; i < realRows; i++) {
				// 新建要转换的对象
				T entity = entityClass.newInstance();
				// 给对象中的字段赋值
				for (Entry<String, String> entry : fieldMap.entrySet()) {
					// 获取中文字段名
					String cnNormalName = entry.getKey();
					// 获取英文字段名
					String enNormalName = entry.getValue();
					// 根据中文字段名获取列号
					int col = colMap.get(cnNormalName);
					Cell cell = sheet.getRow(i).getCell(col);
					// 获取当前单元格中的内容
					Object content = getCellValue(cell);
					// 给对象赋值
					setFieldValueByName(enNormalName, content, entity);
				}
				resultList.add(entity);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// 如果是ExcelException，则直接抛出
			if (e instanceof Exception) {
				throw (Exception) e;
				// 否则将其它异常包装成ExcelException再抛出
			} else {
				e.printStackTrace();
				throw new Exception("导入Excel失败");
			}
		}
		return resultList;
	}

	/**
	 * @MethodName : getFieldValueByName
	 * @Description : 根据字段名获取字段值
	 * @param fieldName 字段名
	 * @param o 对象
	 * @return 字段值
	 */
	private static Object getFieldValueByName(String fieldName, Object o)
			throws Exception {
		Object value = null;
		if (o instanceof HashMap) {
			value = ((HashMap) o).get(fieldName);
		} else {
			Field field = getFieldByName(fieldName, o.getClass());
			if (field != null) {
				field.setAccessible(true);
				// 获取字段类型
				Class<?> fieldType = field.getType();
				// 根据字段类型给字段赋值
				if (Date.class == fieldType) {
					if (field.get(o) != null) {
						value = new SimpleDateFormat("yyyy-MM-dd").format(field.get(o));
					}
				} else if (Boolean.class == fieldType) {
					if (field.get(o) != null) {
						Boolean bool = (boolean) field.get(o);
						if (bool) {
							value = "是";
						} else {
							value = "否";
						}
					}
				} else {
					String className = o.getClass().getName();
					if (fieldName.equals("status")) {
						Map<Short, String> codeMap = new HashMap<Short, String>();
						codeMap.put((short) 10, "未下放");
						codeMap.put((short) 20, "全部下放成功");
						codeMap.put((short) 30, "部分下放成功");
						codeMap.put((short) -1, "异常");
						if (className.equals("com.domain.model.SysShop")
							|| className.equals("com.domain.model.BasCustomer")
								|| className.equals("com.domain.model.BasSku")
									|| className.equals("com.domain.model.BasStock")) {
							value = codeMap.get(field.get(o));
						} else {
							value = field.get(o);
						}
					} else {
						value = field.get(o);
					}
				}
			} else {
				throw new Exception(o.getClass().getSimpleName() + "类不存在字段名 " + fieldName);
			}
		}
		return value;
	}

	/**
	 * @MethodName : getFieldByName
	 * @Description : 根据字段名获取字段
	 * @param fieldName 字段名
	 * @param clazz 包含该字段的类
	 * @return 字段
	 */
	private static Field getFieldByName(String fieldName, Class<?> clazz) {
		// 拿到本类的所有字段
		Field[] selfFields = clazz.getDeclaredFields();
		// 如果本类中存在该字段，则返回
		for (Field field : selfFields) {
			if (field.getName().equals(fieldName)) {
				return field;
			}
		}
		// 否则，查看父类中是否存在此字段，如果有则返回
		Class<?> superClazz = clazz.getSuperclass();
		if (superClazz != null && superClazz != Object.class) {
			return getFieldByName(fieldName, superClazz);
		}
		// 如果本类和父类都没有，则返回空
		return null;
	}

	/**
	 * @MethodName : getFieldValueByNameSequence
	 * @Description : 根据带路径或不带路径的属性名获取属性值
	 *     即接受简单属性名，如userName等，又接受带路径的属性名，如student.department.name等
	 * @param fieldNameSequence 带路径的属性名或简单属性名
	 * @param o 对象
	 * @return 属性值
	 * @throws Exception
	 */
	private static Object getFieldValueByNameSequence(String fieldNameSequence,
			Object o) throws Exception {
				
		Object value = null;
		// 将fieldNameSequence进行拆分
		String[] attributes = fieldNameSequence.split("\\.");
		if (attributes.length == 1) {
			value = getFieldValueByName(fieldNameSequence, o);
		} else {
			// 根据属性名获取属性对象
			Object fieldObj = getFieldValueByName(attributes[0], o);
			String subFieldNameSequence = fieldNameSequence
					.substring(fieldNameSequence.indexOf(".") + 1);
			value = getFieldValueByNameSequence(subFieldNameSequence, fieldObj);
		}
		return value;	
	}

	/**
	 * @MethodName : setFieldValueByName
	 * @Description : 根据字段名给对象的字段赋值
	 * @param fieldName 字段名
	 * @param fieldValue 字段值
	 * @param o 对象
	 */
	private static void setFieldValueByName(String fieldName,
			Object fieldValue, Object o) throws Exception {
		Field field = getFieldByName(fieldName, o.getClass());
		if (field != null) {
			field.setAccessible(true);
			// 获取字段类型
			Class<?> fieldType = field.getType();
			// 根据字段类型给字段赋值
			if (String.class == fieldType) {
				field.set(o, String.valueOf(fieldValue));
			} else if ((Integer.TYPE == fieldType)
					|| (Integer.class == fieldType)) {
				field.set(o, Integer.parseInt(fieldValue.toString()));
			} else if ((Long.TYPE == fieldType) || (Long.class == fieldType)) {
				field.set(o, Long.valueOf(fieldValue.toString()));
			} else if ((Float.TYPE == fieldType) || (Float.class == fieldType)) {
				field.set(o, Float.valueOf(fieldValue.toString()));
			} else if ((Short.TYPE == fieldType) || (Short.class == fieldType)) {
				field.set(o, Short.valueOf(fieldValue.toString()));
			} else if ((Double.TYPE == fieldType)
					|| (Double.class == fieldType)) {
				field.set(o, Double.valueOf(fieldValue.toString()));
			} else if (Character.TYPE == fieldType) {
				if ((fieldValue != null)
						&& (fieldValue.toString().length() > 0)) {
					field.set(o, Character.valueOf(fieldValue.toString().charAt(0)));
				}
			} else if (Date.class == fieldType) {
				field.set(o, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.parse(fieldValue.toString()));
			} else {
				field.set(o, fieldValue);
			}
		} else {
			throw new Exception(o.getClass().getSimpleName() + "类不存在字段名 "
					+ fieldName);
		}
	}

	/**
	 * @MethodName : setColumnAutoSize
	 * @Description : 设置工作表自动列宽和首行加粗
	 * @param ws
	 */
	private static void setColumnAutoSize(HSSFSheet sheet, int extraWith) {
		HSSFRow firstRow = sheet.getRow(0);
		if (firstRow != null) {
			// 循环列
			for (int i = 0; i < firstRow.getPhysicalNumberOfCells(); i++) {
				// int colWith = 0;
				// 循环行
				// for (int j = 0; j < sheet.getLastRowNum(); j++) {
				// HSSFRow row = sheet.getRow(j);// 具体某行
				// HSSFCell cell = row.getCell(i);// 具体某列
				//
				// if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
				// String content = cell.getStringCellValue();
				// int cellWith = content.length();
				// if (colWith < cellWith) {
				// colWith = cellWith; // 获取本列的最宽单元格的宽度
				// }
				// }
				// }
				// 设置单元格的宽度为最宽宽度+额外宽度
				sheet.setColumnWidth(i, (short) (35.7 * 150));
			}
		}
	}

	/**
	 * @MethodName : fillSheet
	 * @Description : 向工作表中填充数据
	 * @param sheet 工作表
	 * @param list 数据源
	 * @param fieldMap 中英文字段对应关系的Map
	 * @param columnDtos 多表头单元格集合
	 * @param firstIndex 开始索引
	 * @param lastIndex 结束索引
	 */
	private static <T> void fillSheet(HSSFWorkbook wb, HSSFSheet sheet, List<T> list, 
		LinkedHashMap<String, String> fieldMap, List<ColumnDto> columnDtos, int firstIndex, 
			int lastIndex) throws Exception {
		HSSFCellStyle titleStyle = getTitleStyle(wb);
		HSSFCellStyle columnstyle = getColumnStyle(wb);
		// 定义存放英文字段名和中文字段名的数组
		String[] enFields = new String[fieldMap.size()];
		String[] cnFields = new String[fieldMap.size()];
		// 填充数组
		int count = 0;
		for (Entry<String, String> entry : fieldMap.entrySet()) {
			enFields[count] = entry.getKey();
			cnFields[count] = entry.getValue();
			count++;
		}				
		// 填充表头
		int rowNo = CONTENT_START_POSITION;
		if(columnDtos!=null && columnDtos.size()>0){
			//初始化excel单元格所有表头字段
			List<List<ColumnDto>> columnsList = initColumnsList(columnDtos);
			//表头字段创建单元格样式
			for (int i = 0; i < columnDtos.size(); i++) {
				HSSFRow headRow = sheet.createRow(i);
				for (int j = 0; j < fieldMap.size(); j++) {
					HSSFCell headCell = headRow.createCell(j);
					headCell.setCellStyle(titleStyle);
				}			
			}			
			for (rowNo = 0; rowNo < columnsList.size(); rowNo++) {
				//根据目录层级创建对应的行
				HSSFRow headRow = sheet.getRow(rowNo);
				List<ColumnDto> columns = columnsList.get(rowNo);
				//对应行的所有列循环遍历
				for (ColumnDto column : columns) {
					CellRegionDto cellRegionDto = column.getCellRegionDto();
					//合并单元格
					if(cellRegionDto.isMergeCell()){
						CellRangeAddress region = new CellRangeAddress(
							cellRegionDto.getFirstRow(), 
							cellRegionDto.getLastRow(),
							cellRegionDto.getFirstCol(),
							cellRegionDto.getLastCol()
						);						
						sheet.addMergedRegion(region);
					}
					HSSFCell headCell = headRow.getCell(cellRegionDto.getFirstCol());
					headCell.setCellValue(column.getContent());
				}				
			}
		}else{
			HSSFRow headRow = sheet.createRow(HEAD_START_POSITION);
			for (int i = 0; i < cnFields.length; i++) {
				HSSFCell headCell = headRow.createCell(i);
				headCell.setCellValue(cnFields[i]);
				headCell.setCellStyle(titleStyle);
			}
		}
		// 填充内容		
		for (int index = firstIndex; index <= lastIndex; index++) {
			// 获取单个对象
			HSSFRow contentRow = sheet.createRow(rowNo);
			T item = list.get(index);
			if (item != null) {
				for (int i = 0; i < enFields.length; i++) {
					Object objValue = getFieldValueByNameSequence(enFields[i], item);
					String fieldValue = objValue == null ? "" : objValue.toString();
					HSSFCell contentCell = contentRow.createCell(i);
					contentCell.setCellValue(fieldValue);
					contentCell.setCellStyle(columnstyle);
				}
			}
			rowNo++;
		}
		// 设置自动列宽
		setColumnAutoSize(sheet, 5);
	}
	
	/**
	 * 初始化excel单元格所有表头字段
	 * @param columnsTree
	 * @return
	 */
	private static List<List<ColumnDto>> initColumnsList(List<ColumnDto> columnsTree){
		//组装表头字段集合
		List<List<ColumnDto>> columnsList = new ArrayList<>();
		//目录级数逐层遍历拼装表头列字段
		int columnsMaxLevel = getColumnsMaxLevel(columnsTree);
		for (int i = 0; i < columnsMaxLevel; i++) {
			List<ColumnDto> columns = new ArrayList<>();
			int currCol = 0;
			for (ColumnDto columnTree : columnsTree) {
				List<List<ColumnDto>> list = levelOrder(columnTree);
				//获取当前节点的所有叶子节点数量			
				if(list!=null && list.size()>i){
					List<ColumnDto> currTreeColumns = list.get(i);
					int nodeCol = currCol;
					for (ColumnDto column : currTreeColumns) {						
						CellRegionDto cellRegionDto = new CellRegionDto();
						if(column.getChildren()!=null && column.getChildren().size()>0){
							//获取当前节点的所有叶子节点数量
							int leafsCount = getLeafsCount(column);
							if(leafsCount>1){
								cellRegionDto.setMergeCell(true);																					
							}else{
								cellRegionDto.setMergeCell(false);
							}							
							cellRegionDto.setFirstCol(nodeCol);
							cellRegionDto.setFirstRow(i);							
							cellRegionDto.setLastRow(i);
							nodeCol = (nodeCol + leafsCount - 1);
							cellRegionDto.setLastCol(nodeCol);
						}else{						
							if(columnsMaxLevel!=(i+1)){
								cellRegionDto.setMergeCell(true);
							}else{
								cellRegionDto.setMergeCell(false);
							}
							cellRegionDto.setFirstCol(nodeCol);
							cellRegionDto.setFirstRow(i);
							cellRegionDto.setLastCol(nodeCol);
							cellRegionDto.setLastRow(columnsMaxLevel-1);							
						}					
						column.setCellRegionDto(cellRegionDto);
						columns.add(column);	
						nodeCol++;
					}				
				}
				//当换一颗树的时候需要将前一颗树的列数累加,作为下一棵树的起始列
				if(columnTree.getChildren()!=null && columnTree.getChildren().size()>0){
					currCol += getLeafsCount(columnTree);
				}else{
					currCol++;
				}
			}
			columnsList.add(columns);
		}
		return columnsList;
	}
		
	/**
	 * 获取当前节点的所有叶子节点数量
	 * @param currNode
	 */
	private static int getLeafsCount(ColumnDto currNode) {
		List<ColumnDto> leafs = new ArrayList<>();
		getAllLeafs(currNode, leafs);	
		return leafs.size();
	}
	
	/**
	 * 获取当前节点的所有叶子节点集合
	 * @param currNode
	 * @param leafs
	 */
	private static void getAllLeafs(ColumnDto currNode, List<ColumnDto> leafs) {
		List<ColumnDto> list = currNode.getChildren();
		if(list!=null){
			for (ColumnDto childNode : list) {				
				if(childNode.getChildren()!=null && childNode.getChildren().size()>0){
					getAllLeafs(childNode, leafs);
				}else{
					leafs.add(childNode);
				}											
			}
		}		
	}

	/**
	 * 获取单元格的层级最大目录
	 * @param columnDtos
	 * @return
	 */
	private static int getColumnsMaxLevel(List<ColumnDto> columnDtos) {
		int maxLevel = 0;
		for (ColumnDto columnDto : columnDtos) {		
			int cellLevel = columnDto.getCellLevel();
			if(maxLevel<cellLevel){
				maxLevel = cellLevel;
			}
			if(columnDto.getChildren()!=null && columnDto.getChildren().size()>0){
				List<ColumnDto> leafs = new ArrayList<>();
				getAllLeafs(columnDto, leafs);
				for (ColumnDto leaf : leafs) {
					cellLevel = leaf.getCellLevel();
					if(maxLevel<cellLevel){
						maxLevel = cellLevel;
					}
				}
			}
		}
		return maxLevel;
	}

	/**
	 * N叉树的层序遍历
	 * @param root
	 * @return
	 */
    private static List<List<ColumnDto>> levelOrder(ColumnDto root) {
        List<List<ColumnDto>> lists = new ArrayList<>();
        if (root == null) {
        	return lists;
        }
        Queue<ColumnDto> headerQueue = new LinkedList<>();
        headerQueue.add(root);
        List<ColumnDto> list = new ArrayList<>();
        ColumnDto tempNode = null;
        while (!headerQueue.isEmpty()) {
            int levelSize = headerQueue.size();
            for (int i = 0; i < levelSize; i++) {
            	tempNode = headerQueue.poll();
                // 跟二叉树的层序遍历的区别在于，这里加入的是所有子树
                headerQueue.addAll(tempNode.getChildren());
                list.add(tempNode);
            }
            lists.add(new ArrayList<>(list));
            list.clear();
        }
        return lists;
    }

	/**
	 * 读取单元格的值
	 * @param cell 单元格
	 * @return 单元格的值
	 */
	private static <T> Object getCellValue(Cell cell) {
		Object cellValue = null;
		if (cell != null) {
			switch (cell.getCellType()) {
			case Cell.CELL_TYPE_STRING:
				cellValue = cell.getStringCellValue();
				break;
			case Cell.CELL_TYPE_NUMERIC:
				cellValue = cell.getNumericCellValue();
				break;
			case Cell.CELL_TYPE_BOOLEAN:
				cellValue = cell.getBooleanCellValue();
				break;
			case Cell.CELL_TYPE_FORMULA:
				cellValue = cell.getCellFormula();
				break;
			case Cell.CELL_TYPE_ERROR:
				cellValue = cell.getErrorCellValue();
				break;
			case Cell.CELL_TYPE_BLANK:
				break;
			default:
				break;
			}
		}
		return cellValue;
	}

	/**
	 * 列头单元格样式
	 * @param workbook
	 * @return
	 */
	public static <T> HSSFCellStyle getTitleStyle(HSSFWorkbook workbook) {
		// 设置字体
		HSSFFont font = workbook.createFont();
		// 设置字体大小
		font.setFontHeightInPoints((short) 11);
		// 字体加粗
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		// 设置字体名字
		font.setFontName("Courier New");
		// 设置样式;
		HSSFCellStyle style = workbook.createCellStyle();
		// 设置底边框;
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		// 设置底边框颜色;
		style.setBottomBorderColor(HSSFColor.BLACK.index);
		// 设置左边框;
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		// 设置左边框颜色;
		style.setLeftBorderColor(HSSFColor.BLACK.index);
		// 设置右边框;
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		// 设置右边框颜色;
		style.setRightBorderColor(HSSFColor.BLACK.index);
		// 设置顶边框;
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		// 设置顶边框颜色;
		style.setTopBorderColor(HSSFColor.BLACK.index);
		// 在样式用应用设置的字体;
		style.setFont(font);
		// 设置自动换行;
		style.setWrapText(false);
		// 设置水平对齐的样式为居中对齐;
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		// 设置垂直对齐的样式为居中对齐;
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

		return style;
	}

	/**
	 * 列数据信息单元格样式
	 * @param workbook
	 * @return
	 */
	public static <T> HSSFCellStyle getColumnStyle(HSSFWorkbook workbook) {
		// 设置字体
		HSSFFont font = workbook.createFont();
		// 设置字体大小
		// font.setFontHeightInPoints((short)10);
		// 字体加粗
		// font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		// 设置字体名字
		font.setFontName("Courier New");
		// 设置样式;
		HSSFCellStyle style = workbook.createCellStyle();
		// 设置底边框;
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		// 设置底边框颜色;
		style.setBottomBorderColor(HSSFColor.BLACK.index);
		// 设置左边框;
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		// 设置左边框颜色;
		style.setLeftBorderColor(HSSFColor.BLACK.index);
		// 设置右边框;
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		// 设置右边框颜色;
		style.setRightBorderColor(HSSFColor.BLACK.index);
		// 设置顶边框;
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		// 设置顶边框颜色;
		style.setTopBorderColor(HSSFColor.BLACK.index);
		// 在样式用应用设置的字体;
		style.setFont(font);
		// 设置自动换行;
		style.setWrapText(false);
		// 设置水平对齐的样式为居中对齐;
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		// 设置垂直对齐的样式为居中对齐;
		// style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

		return style;
	}

}
