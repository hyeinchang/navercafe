<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="address" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}"/>

  <!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
					
            	<!-- Page Heading -->
               	<h1 class="h3 text-gray-800 cstmTitle">기본정보</h1>
               	<div class="cstmContent1">
               		<form class="user">
                    	<div class="form-group row">
                         	<div class="card mb-4 py-3 border-left-primary">
                         		<div class="card-body">
                             	.border-left-primary
                         	</div>
                     	</div>
                             <div class="col-sm-6 mb-3 mb-sm-0">
                                 <input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="First Name">
                             </div>
                              <a href="#" class="btn btn-success btn-icon-split">
                                <span class="icon text-white-50">
                                    <i class="fas fa-check"></i>
                                </span>
                                <span class="text">중복확인</span>
                          	</a>
                         </div>
                         <div class="form-group">
                             <input type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Email Address">
                         </div>
                         <div class="form-group row">
                             <div class="col-sm-6 mb-3 mb-sm-0">
                                 <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">
                             </div>
                             <div class="col-sm-6">
                                 <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">
                             </div>
                         </div>
                         <a href="login.html" class="btn btn-primary btn-user btn-block">
                             Register Account
                         </a>
                         <hr>
                         <a href="index.html" class="btn btn-google btn-user btn-block">
                             <i class="fab fa-google fa-fw"></i> Register with Google
                         </a>
                         <a href="index.html" class="btn btn-facebook btn-user btn-block">
                             <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                         </a>
                     </form>
                	<table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info">
                    	<colgroup>
                    		<col width="30%">
                    		<col width="70%">
                    	</colgroup>
                    	<tbody>
                    		<tr>
                            	<th>카페아이디</th>
                                <td>
                                	<div class="form-group row">
	                                    <div class="col-sm-6">
	                                        <input type="text" class="form-control form-control-user" id="exampleLastName" placeholder="Last Name">
	                                    </div>
		                               
                                	</div>
                                	
                                </td>
                            </tr>
                        	<tr>
                            	<th>카페주소</th>
                                <td>${address}/main?cafeId=cafeId1</td>
                            </tr>
                            <tr>
                              	<th>카페설명</th>
                              	<td>
                              		<textarea></textarea>
                              	</td>
                            </tr>   
						</tbody>
                    </table>
               	</div>
					
					
            </div>
            <!-- End of Main Content -->
         