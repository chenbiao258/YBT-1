<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

  	<meta http-equiv="x-ua-compatible" content="IE=edge" >
<!-- User Info, Notifications and Menu Bar -->
<nav class="navbar user-info-navbar" role="navigation">				

	<!-- Right links for user info navbar -->
	<ul class="user-info-menu right-links list-inline list-unstyled">

		<li class="">
			<label id="showTime"></label>
		</li>

		<li class="dropdown user-profile">
			<a href="#" data-toggle="dropdown">
				<img src="<%=request.getContextPath() %>/include/images/user-4.png" alt="user-image" class="img-circle img-inline userpic-32" width="28" />
				<span>
					${userLoginInfo.userCode}
				<i class="fa-angle-down"></i> 
			</span>
			</a>

			<ul class="dropdown-menu user-profile-menu list-unstyled">
				<li>
					<a href="#edit-profile">
						<i class="fa-edit"></i> New Post
					</a>
				</li>
				<li>
					<a href="#settings">
						<i class="fa-wrench"></i> Settings
					</a>
				</li>
				<li>
					<a href="#profile">
						<i class="fa-user"></i> Profile
					</a>
				</li>
				<li>
					<a href="#help">
						<i class="fa-info"></i> Help
					</a>
				</li>
				<li class="last">
					<a href="#">
						<i class="fa-lock"></i> Logout
					</a>
				</li>
			</ul>
		</li>

	</ul>

</nav>

	   