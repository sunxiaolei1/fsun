package org.jasig.cas.adaptors.jdbc;

import java.security.GeneralSecurityException;

import javax.security.auth.login.AccountNotFoundException;
import javax.security.auth.login.FailedLoginException;
import javax.sql.DataSource;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.jasig.cas.authentication.HandlerResult;
import org.jasig.cas.authentication.PreventedException;
import org.jasig.cas.authentication.UsernamePasswordCredential;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.stereotype.Component;

import com.fsun.cas.utils.MD5Utils;

/**
 * @author fsun
 * @date 2019年5月22日
 */
@Component("customQueryDatabaseAuthenticationHandler")
public class CustomQueryDatabaseAuthenticationHandler extends AbstractJdbcUsernamePasswordAuthenticationHandler {

	@NotNull
    private String sql;
	
	@NotNull
    private String saltSql; 

    @Override
    protected final HandlerResult authenticateUsernamePasswordInternal(final UsernamePasswordCredential credential)
            throws GeneralSecurityException, PreventedException {

        if (StringUtils.isBlank(this.sql) || getJdbcTemplate() == null) {
            throw new GeneralSecurityException("Authentication handler is not configured correctly");
        }

        final String username = credential.getUsername();
        //获取用户输入的密码
        final String encryptedPassword = this.getPasswordEncoder().encode(credential.getPassword());
        //final String encryptedPassword = MD5Utils.md5SaltEncode(credential.getPassword(), username);
        try {
            final String dbPassword = getJdbcTemplate().queryForObject(this.sql, String.class, username);
            //获取盐值
            final String salt = getJdbcTemplate().queryForObject(this.saltSql, String.class, username);
            //使用Md5Hash的构造方法将用户输入的密码进行加密，加密次数为2
            String md5Pwd = MD5Utils.md5SaltEncode(encryptedPassword, salt);
            if (!dbPassword.equals(md5Pwd)) {
                throw new FailedLoginException("Password does not match value on record.");
            }
        } catch (final IncorrectResultSizeDataAccessException e) {
            if (e.getActualSize() == 0) {
                throw new AccountNotFoundException(username + " not found with SQL query");
            } else {
                throw new FailedLoginException("Multiple records found for " + username);
            }
        } catch (final DataAccessException e) {
            throw new PreventedException("SQL exception while executing query for " + username, e);
        }
        return createHandlerResult(credential, this.principalFactory.createPrincipal(username), null);
    }

    /**
     * @param sql The sql to set.
     */
    @Autowired
    public void setSql(@Value("${cas.jdbc.authn.query.sql:}") final String sql) {
        this.sql = sql;
    }
    
    /**
     * @param saltSql The saltSql to set.
     */
    @Autowired
    public void setSaltSql(@Value("${cas.jdbc.authn.query.saltSql:}") final String saltSql) {
        this.saltSql = saltSql;
    }

    @Override
    @Autowired(required = false)
    public void setDataSource(@Qualifier("queryDatabaseDataSource") final DataSource dataSource) {
        super.setDataSource(dataSource);
    }
}