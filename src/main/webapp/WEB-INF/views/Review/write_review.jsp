<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<style type="text/css">
/*  * {
  margin: 0;
  padding: 0;
}
body {
  width: 700px;
  margin: 40px auto;
}  */

/* input file type */
.input-file {
  display: inline-block;
}

.input-file [type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0 none;
}
.input-file .file-label {
  display: inline-block;
  min-width: 53px;
  height: 27px;
  line-height: 24px;
  padding: 0 10px;
  border-radius: 2px;
  font-size: 13px;
  background-color: #333;
  color: #fff;
  text-align: center;
}
.input-file .file-name {
  width: 300px;
  background: #f5f5f5;
  height: 27px;
  line-height: 26px;
  text-indent: 5px;
  border: 1px solid #bbb;
}

/* 접근성 탭 포커스 스타일 */
.file-focus {
  outline: 1px dotted #d2310e;
}

</style>
<meta charset="UTF-8">
<title>후기작성</title>

<script type="text/javascript">
(function($){
	  
	  var $fileBox = null;
	  
	  $(function() {
	    init();
	  })
	  
	  function init() {
	    $fileBox = $('.input-file');
	    fileLoad();
	  }
	  
	  function fileLoad() {
	    $.each($fileBox, function(idx){
	      var $this = $fileBox.eq(idx),
	          $btnUpload = $this.find('[type="file"]'),
	          $label = $this.find('.file-label');
	      
	      $btnUpload.on('change', function() {
	        var $target = $(this),
	            fileName = $target.val(),
	            $fileText = $target.siblings('.file-name');
	        $fileText.val(fileName);
	      })
	      
	      $btnUpload.on('focusin focusout', function(e) {
	        e.type == 'focusin' ?
	          $label.addClass('file-focus') : $label.removeClass('file-focus');
	      })
	      
	    })
	  }
	  
	  
	})(jQuery);
</script>


</head>
<body>
	<h3>후기작성</h3>
	<hr style="border:  solid 1px black;"><br>
	- 후기 작성 시, 500원의 적립금을 드립니다.<br>
	- 후기 내용은 단순 문자 및 기호의 나열/반복은 적립금이 지급되지 않습니다.<br>
	- 이메일, 휴대전화 번호 등의 개인 정보/광고/비속어가 포함된 후기는 블라인드 처리됩니다.<br>
	- 등록하신 후기는 공개되어 회원이 조회 가능합니다.<br>
	<br><br>
	
	<table >
		<tr>
			<td rowspan="3"><img src="/RAUM/resources/image/${review_write.image}" width="80" height="80"/><br/></td>

		</tr>
		<tr>
			<td>${review_write.name }</td> 
		</tr>
		<tr>
			<td>${review_write.size }</td>
		</tr>			
	</table >
	<hr style="color: #A4A4A4"> <br><br>


    <form name="fileForm" action="writeReview.do" method="post" enctype="multipart/form-data">
		<table>
		<tr>
			<td>
				<div class="input-file">
				  <input type="text" readonly="readonly" class="file-name"/>
				  <label for="upload02" class="file-label">찾아보기</label>
				  <input type="file" name="file" id="upload02" class="file-upload" />
				</div>
			</td>
		</tr>
			<tr>
				<td><input type="hidden" name="seq" value="${review_write.seq}"><br><br></td>
			</tr>
			<tr>
				<td><input type="text" name="title" size="52" placeholder="제목"><br><br></td>
			</tr>
			<tr>
				<td><textarea name="content" cols="50" rows="15" placeholder="내용"></textarea></td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="등록하기" style="height:25px; width:100px;"></td>
			</tr>	
		</table>
    </form>

	
</body>
</html>