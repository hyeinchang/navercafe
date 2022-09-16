<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="adminPath" value="${contextPath}/resources/admin"/>
<c:set var="adminViewPath" value="${contextPath }/admin" />
${cafeId}
  <!-- Page Wrapper -->
    <div id="wrapper">
    
<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

             <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${adminViewPath}">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3"> 관리 HOME <sup>2</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <!-- 
            <li class="nav-item active">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>
             -->
<%--
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>
 --%>
 
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#cafeManage"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>카페 운영</span>
                </a>
                <div id="cafeManage" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Custom Components:</h6> -->
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/basicInfo')">기본 정보</a>
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/eventManage')">이벤트 관리</a>
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/layoffManager')">매니저 위임</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#memberStaff"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>멤버 &middot; 스탭 </span>
                </a>
                <div id="memberStaff" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/manageAllMembers')">전체 멤버 관리</a>
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/manageDeportedMembers')">강제탈퇴 멤버 관리</a>
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/manageStaffs')">스텝 관리</a>
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#registerGrade"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>가입 &middot; 등급</span>
                </a>
                <div id="registerGrade" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/manageMembersGrade')">멤버 등급 관리</a>
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/manageRegisterBan')">가입 불가 관리</a>
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/manageRegisterInfo')">가입 정보 관리</a>
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/manageRegisterRequest')">가입 신청 관리</a>
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#menu"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>메뉴</span>
                </a>
                <div id="menu" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/menu')">메뉴 관리</a>
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#deco"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>꾸미기</span>
                </a>
                <div id="deco" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/deco/frontdoor')">카페 대문</a>
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/deco/skin')">스킨</a>
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/deco/title')">타이틀</a>
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#email"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>메일</span>
                </a>
                <div id="email" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="javascript:changeMenu('${adminViewPath}/email')">메일 보내기</a>
                    </div>
                </div>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider">


            <!-- Sidebar Message -->
            <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="${adminPath }/img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
            </div>

        </ul>
        <!-- End of Sidebar -->
<form name="cafeForm">
	<input type="hidden" name="cafeId" value="${cafeDTO.cafeId}">
</form>        
<script type="text/javascript">
	function changeMenu(path) {
		document.cafeForm.action = path;
		document.cafeForm.submit();
	}
</script>        