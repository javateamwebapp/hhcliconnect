<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 10px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
</style>

<%-- <jsp:include page="index.jsp"></jsp:include> --%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>

<script  type="text/javascript" >

$(document).ready(function()
			{
				$('#search').keyup(function()
				{
					searchTable($(this).val());
				});
			});
			
			function searchTable(inputVal)
			{
				var table = $('#tblData');
				table.find('tr').each(function(index, row)
				{
					var allCells = $(row).find('td');
					if(allCells.length > 0)
					{
						var found = false;
						allCells.each(function(index, td)
						{
							var regExp = new RegExp(inputVal, 'i');
							if(regExp.test($(td).text()))
							{
								found = true;
								return false;
							}
						});
						if(found == true)$(row).show();else $(row).hide();
					}
				});
			}
</script>



<script>
function CallRad(val){
  var id=val+"g";
  alert("Total Gross Value::" +document.getElementById(val+'g').innerHTML );
}
</script>

<style type="text/css">

#scroll {
    /* width:98%; */
    height:550px;
    overflow-y: scroll;
    overflow-x: scroll;
    
    }
  .table  tr:hover td{background:#a9a9f5;}
</style>

<title>Insert title here</title>
<% 
Map Basics=(Map)request.getAttribute("Basic");
Map FinalComponents=(Map)request.getAttribute("FinalComponents");
Map TaxException=(Map)request.getAttribute("TaxException");
Map TaxSections=(Map)request.getAttribute("TaxSections");
ArrayList empids=(ArrayList)request.getAttribute("empids");
ArrayList taxempids=(ArrayList)request.getAttribute("taxempids");


String ProposedMonths=(String)request.getAttribute("ProposedMonths");



int Total_Months=0;
java.util.Iterator empseq = taxempids.iterator();

//java.util.Iterator empseq = empids.iterator();

%>
</head>
<body>

<form method="post" action="display_xls.jsp">

<div class="container">
<p align="right">Search:&nbsp;&nbsp;<input type="text" id="search"  placeholder="Type to search"></p>
<div id="scroll" style="margin-top:10px; margin-left:10px;">
<table class="table" id="tblData" border='1'>
 <tr> <!-- <td>&nbsp;</td> --> 
 <td colspan='12' align='center' class="success" ><b> Paid Months</b> </td>  
 <td colspan='8' align='center' style="background-color:#ece0f8"><b>Proposed Months</b></td> 
 <td colspan='9' align='center' style="background-color:#e6e6e6"><b>Total Per Annum</b></td>
 
 <td colspan='10' align='center' class="info"><b>Tax Exemption</b></td>
 
 <td colspan='16' align='center' class="danger" ><b>TAX Calculation</b></td>
 </tr>
 
 <tr><th>Check</th> <th> ID</th>  <th>Name</th>  <th>Basic</th> <th>CA</th> <th>HRA</th> <th>Medical</th> <th>Education</th> <th>PT(Dedu)</th> <th>Gross</th> <th>Pay Period</th> <th>Months</th>
 <th>Basic</th> <th>CA</th> <th>HRA</th> <th>Medical</th> <th>Education</th> <th>PT(Dedu)</th> <th>Gross</th>  <th>Months</th> 
 
 <th>Basic(T)</th> <th>CA(T)</th> <th>HRA(T)</th> <th>Medical(T)</th> <th>Education(T)</th> <th>PT(Dedu)(T)</th> <th>PF-80C(Dedu)(T)</th> <th>Gross(T)</th>  <th>Total(T)</th>
 
 <th>HouseRent</th> <th>(Rent-Basic10%)</th> <th>Basic(40%/50%)</th> <th>CA</th> <th>Medical</th> <th>ChildEdu</th> <th> Exemption(CTC) </th> <th>IHP(income)</th><th>Others(Income)</th> <th>FinalIncome</th> 
 <th>80C&PF&Others(E)</th><th>80D&Others(E)</th> <th>80G(E)</th> <th>Home Loan Additional(E)</th> <th>Interest On Loan(E)</th>  <th>TaxbleAmt</th>  <th>Exemption Amount</th><th>Tax %</th><th>87A</th><th>Tax(Without Cess)</th>  <th>EduCess(3%)</th>  <th>TAX(Annual)</th> <th>Paid TDS</th> <th>Proposed Months/Remaining</th> <th>Tax(To be Paid)</th> <!-- <th>TAX(Month)</th> -->
 </tr>
  <% 
    while(empseq.hasNext()){
	 String empid= empseq.next().toString(); 
	 Double gross=0.0 , pt=0.0 , income=0.0 ;
	 gross=Double.parseDouble(Basics.get(empid+".gross").toString());
	 pt=Double.parseDouble(Basics.get(empid+".Pt").toString());
	 income=gross-pt;
	 Total_Months=(Integer.parseInt(Basics.get(empid+".pm").toString()))+(Integer.parseInt(ProposedMonths));
		
	// System.out.println("Income :: "+income);
  %>
 <tr>
 <td align="center"> <input type='checkbox' name="<%=empid %>" onclick="CallRad('<%=empid %>')" /> </td> 
 <td><%=empid%></td>
 <td><%=Basics.get(empid+".callname") %></td>
 
  <td id="<%=empid+"b" %>" >  <%=Basics.get(empid+".basic") %>      </td>
 <td id="<%=empid+"c" %>" >  <%=Basics.get(empid+"-CA") %>         </td>
 <td id="<%=empid+"h" %>" >  <%=Basics.get(empid+".Hra") %>        </td>
 <td id="<%=empid+"m" %>" >  <%=Basics.get(empid+".Medical") %>    </td>
 <td id="<%=empid+"e" %>" >  <%=Basics.get(empid+".Education") %>  </td>
 <td id="<%=empid+"p" %>" >  <%=Basics.get(empid+".Pt") %>         </td> 
 <td id="<%=empid+"g" %>" >  <%=Basics.get(empid+".gross") %>      </td>
  <td id="<%=empid+"pm" %>" >  <%=Basics.get(empid+".preriod") %>  </td>
  <td id="<%=empid+"pm" %>" >  <%=Basics.get(empid+".pm") %>       </td>
 
 
 
 
 <td id="<%=empid+"pb" %>" >  <%=Basics.get(empid+"-24") %>      </td>
 <td id="<%=empid+"pc" %>" >  <%=Basics.get(empid+"-26") %>      </td>
 <td id="<%=empid+"ph" %>" >  <%=Basics.get(empid+"-25") %>      </td>
 <td id="<%=empid+"pm" %>" >  <%=Basics.get(empid+"-27") %>      </td>
 <td id="<%=empid+"pe" %>" >  <%=Basics.get(empid+"-28") %>      </td>
 <td id="<%=empid+"pp" %>" >  <%=Basics.get(empid+"-30") %>      </td> 
 <td id="<%=empid+"pg" %>" >  <%=Basics.get(empid+"-22") %>      </td>
 <td id="<%=empid+"pg" %>" >  <%=ProposedMonths %>               </td>
 
 <td id="<%=empid+"pb" %>" >  <%=FinalComponents.get(empid+"-basic") %>      </td>
 <td id="<%=empid+"pc" %>" >  <%=FinalComponents.get(empid+"-CA") %>         </td>
 <td id="<%=empid+"ph" %>" >  <%=FinalComponents.get(empid+"-Hra") %>        </td>
 <td id="<%=empid+"pm" %>" >  <%=FinalComponents.get(empid+"-Medical") %>    </td>
 <td id="<%=empid+"e" %>" >  <%=FinalComponents.get(empid+"-Education") %>   </td>
 <td id="<%=empid+"pe" %>" >  <%=FinalComponents.get(empid+"-Pt") %>         </td>
 
 <td id="<%=empid+"pe" %>" >  <%=FinalComponents.get(empid+"-PF") %>         </td>
 
 <td id="<%=empid+"pg" %>" >  <%=FinalComponents.get(empid+"-gross") %>      </td>
  
  
  
 <td id="<%=empid+"pg" %>" > <b> <%=FinalComponents.get(empid+"-ANN_totalgros") %> </b> </td>
 
		  
  <td id="<%=empid+"pg" %>" >  <%=TaxException.get(empid+".houserent") %>  		</td>
  
  <td id="<%=empid+"pg" %>" >  <%=TaxException.get(empid+".HouseFinal") %>  	</td>
  
  <td id="<%=empid+"pg" %>" >  <%=TaxException.get(empid+".Basi40_RE_y") %>  		</td>
  
  <td id="<%=empid+"pg" %>" >  <%=TaxException.get(empid+"_CA_M_y") %>  			</td>
  
  <td id="<%=empid+"pg" %>" >  <%=TaxException.get(empid+".Medical_y") %>  		</td>
  
  <td id="<%=empid+"pg" %>" >  <%=TaxException.get(empid+".ChildEdu_y") %>  		</td>
 
  <td id="<%=empid+"pg" %>" >  <%=TaxException.get(empid+".ExmpAmount_y") %>  			</td>
  
  <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"INHR").toString() %>  	</td>
   <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"_OTHERINCOME").toString() %>  	</td>
   
  <td id="<%=empid+"pg" %>" ><b>  <%=TaxException.get(empid+".FinalIncome").toString() %> </b> </td>
   
  <!-- <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"80C").toString() %>  	</td>  -->
  
  <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"_80C_E").toString() %>  	</td>
  <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"_80D_E").toString() %>  	</td>
  <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"S_80G_E").toString() %>  	</td>
  
  <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"_RENT80EE_E").toString() %>  	</td>
  <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"_RENTINTEREST_E").toString() %>  	</td>
  
 <!-- <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"80D").toString() %>  	</td>  -->
  
   <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"ANN_TxamT").toString()%>  </td> 
   
   <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"_ANN_EmpTax_E").toString()%>  </td>
   <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"_ANN_EmpTaxPer_E").toString()%>  </td>
   <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"_ANN_EmpTaxAddl_E").toString()%>  </td>
   
   <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"_ANN_Emp_Tax_E").toString()%>  </td>
   
   
  <td id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"ANN_Educess").toString() %></td> 
 
  <td style="color:Red" id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"ANN_tx_Paid").toString() %>  </td> 
  
  <!-- <td style="color:Red" id="<%=empid+"pg" %>" >  <%=Total_Months %>  </td> --->
  
  <td style="color:Red" id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"_TDS_F").toString() %>  </td> 
    
   <td>      <%=ProposedMonths %>  </td>
   
    <td style="color:Red" id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"ANN_tx_Paid_F").toString() %>  </td> 
    
   <%--   <td style="color:Red" id="<%=empid+"pg" %>" >  <%=TaxSections.get(empid+"Paid_Month").toString() %>  </td>  --%>
     
    
 
</tr>

 <%}%> 
   
 </table>
 </div>
 </div>
<center>
 <input type="submit" class="button" value="Export Exl" > <input type='button' value="Downloads" onclick="Download();" class="button" value="Export Exl" >
 </center>
<script>
function Download(){
	
 document.forms[0].action="Zipdownload";
 document.forms[0].submit();
	
}
</script>
  </form>

</body>
</html>