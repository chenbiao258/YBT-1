<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />
	<title>保险产品新增</title>
	
	<%@ include file="../../../main/jsp/top.jsp" %>

</head>
<%-- 	<link href="<%=request.getContextPath() %>/include/js/external/jquery-ui.css" rel="stylesheet">
	<style>
	
	#dialog-link {
		padding: .4em 1em .4em 20px;
		text-decoration: none;
		position: relative;
	}
	#dialog-link span.ui-icon {
		margin: 0 5px 0 0;
		position: absolute;
		left: .2em;
		top: 50%;
		margin-top: -8px;
	}
	</style> --%>

<body class="page-body skin-facebook">
	<div class="page-container">    
		
		
		<div class="main-content">
					
			<%@ include file="../../../main/jsp/nav.jsp" %>
				
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<form action="" method="" role="form" class="form-horizontal">
								
							

										<div class="form-group">
									
									
									 
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3"></label>
										<div class="col-sm-2">
											<button type="button" class="btn btn-primary"  id="download">下载内部资质信息</button>
										</div>
											</div>
									
								</div>
							
							</form>
							</div>
											</div>
									
								</div>
							</div></div></div>
							

<!-- <h2 class="demoHeaders">Dialog</h2>
<p>
	<button id="dialog-link" class="ui-button ui-corner-all ui-widget">
		<span class="ui-icon ui-icon-newwin"></span>Open Dialog
	</button>
</p>
 -->
<%-- 
<!-- ui-dialog -->
<div id="dialog" title="Dialog Title">
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>





<script src="<%=request.getContextPath() %>/include/js/external/jquery/jquery.js"></script>
<script src="<%=request.getContextPath() %>/include/js/external/jquery-ui.js"></script>
<script>





$( "#dialog" ).dialog({
	autoOpen: false,
	width: 400,
	buttons: [
		{
			text: "Ok",
			click: function() {
				$( this ).dialog( "close" );
			}
		},
		{
			text: "Cancel",
			click: function() {
				$( this ).dialog( "close" );
			}
		}
	]
});

// Link to open the dialog
$( "#dialog-link" ).click(function( event ) {
	$( "#dialog" ).dialog( "open" );
	event.preventDefault();
});
// Hover states on the static widgets
$( "#dialog-link, #icons li" ).hover(
	function() {
		$( this ).addClass( "ui-state-hover" );
	},
	function() {
		$( this ).removeClass( "ui-state-hover" );
	}
);
</script>
						</div>

						
						
					</div>
				</div>
			</div>
		
			<%@ include file="../../../main/jsp/footer.jsp" %>
		</div>
		
	</div>
	
	
	<%@ include file="../../../main/jsp/bottom.jsp" %>
	
	<!-- Imported scripts on this page -->
	
	<!-- Imported scripts on this page --> --%>
	<script src="<%=request.getContextPath() %>/application/customermanager/newCustomermanager/res/js/downloadex.js" type="text/javascript" charset="utf-8"></script>

	
</body>
</html>