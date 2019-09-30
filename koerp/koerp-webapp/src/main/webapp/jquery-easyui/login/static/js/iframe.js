window.onload = function() {
  var reg = new RegExp("(^||&)" + "evcard\-sso\\/login\.html" + "([^&]*)(&|$)");
  if (reg.test(window.location.pathname)) {
    window.parent.postMessage('no-login', window.location.origin)
  }
  window.addEventListener('message', function(event) {
    if (event.data === 'from-all') {
      var timer = setInterval(function() {
        var $pageView = document.querySelector('.router-view-wrap');
        if ($pageView) {
          $pageView.style.position = 'fixed';
          $pageView.style.top = 0;
          $pageView.style.left = 0;
          $pageView.style.width = '100%';
          $pageView.style.height = '100%';
          $pageView.style.zIndex = 999;
          $pageView.style.background = '#fff';
          clearInterval(timer);
          // window.parent.postMessage('success', window.location.origin)
          insertStyles();
          event.source.postMessage('success', event.origin);
        }
      }, 100)
    }
  }, false)
}

// 弹窗有点问题
function insertStyles() {
  var styles = document.createElement('style')
  styles.id = 'style-id'
  styles.type = 'text/css'
  if(styles.styleSheet){
  　　styles.styleSheet.cssText = '.v-modal{display: none!important;}.el-dialog__wrapper{background-color: rgba(0, 0, 0, 0.5);}body{overflow: hidden!important;}'//IE
  }else{
  　　styles.appendChild(document.createTextNode('.v-modal{display: none!important;}.el-dialog__wrapper{background-color: rgba(0, 0, 0, 0.5);}body{overflow: hidden!important;}'))//for FF
  }
  document.getElementsByTagName('head')[0].appendChild(styles)
}
