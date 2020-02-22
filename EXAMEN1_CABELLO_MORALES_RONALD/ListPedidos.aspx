<%@Page Title="|Cabello|" Language="C#" MasterPageFile="~/Menuprincipal.Master" AutoEventWireup="true"
CodeBehind="ListPedidos.aspx.cs" Inherits="EXAMEN1_CABELLO_MORALES_RONALD.ListPedidos" %>


<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <!-- PONER LOS SCRIPT Y ESTILOS PARA ALGUNOS CONTROLES O DISEÑO ESPECIFICOS-->
        
    <!-- BEGIN META -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="your,keywords">
    <meta name="description" content="Short explanation about this website">
    <!-- END META -->

    <!-- BEGIN STYLESHEETS -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:300italic,400italic,300,400,500,700,900' rel='stylesheet' type='text/css' />
    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyATl9ix61kDPA0fayPgohOfxI5T7V1EQcQ">
    </script>
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/bootstrap.css?1422792965" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/materialadmin.css?1425466319" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/font-awesome.min.css?1422529194" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/material-design-iconic-font.min.css?1421434286" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/libs/DataTables/jquery.dataTables.css?1423553989" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/libs/DataTables/extensions/dataTables.colVis.css?1422823421" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/libs/DataTables/extensions/dataTables.tableTools.css?1422823422" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/libs/select2/select2.css?1424887856" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/libs/multi-select/multi-select.css?1424887857" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/libs/bootstrap-datepicker/datepicker3.css?1424887858" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/libs/jquery-ui/jquery-ui-theme.css?1423393666" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/libs/bootstrap-colorpicker/bootstrap-colorpicker.css?1424887860" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/libs/bootstrap-tagsinput/bootstrap-tagsinput.css?1424887862" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/libs/typeahead/typeahead.css?1424887863" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/libs/toastr/toastr.css?1425466569" />
    <link type="text/css" rel="stylesheet" href="/assets/css/theme-default/libs/dropzone/dropzone-theme.css?1424887864" />
    <link href="/assets/css/Propio/propio.css" rel="stylesheet" />
    
    <link href="/assets/js/lightbox/ekko-lightbox.min.css" rel="stylesheet" />
   <link href="assets/timepicker/bootstrap-timepicker.min.css" rel="stylesheet" />
    <script src="assets/jquery-1.3.2.min.js"></script>

  <script type="text/javascript">


    function SoloNumeros() {
        if ((event.keyCode < 48) || (event.keyCode > 57)) {
            event.returnValue = false;
        }

    }


    $(function () {
        //Array para dar formato en español
        $.datepicker.regional['es'] =
        {
            closeText: 'Cerrar',
            prevText: 'Previo',
            nextText: 'Próximo',

            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
            'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
            'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
            monthStatus: 'Ver otro mes', yearStatus: 'Ver otro año',
            dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
            dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sáb'],
            dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
            dateFormat: 'dd/mm/yy', firstDay: 0,
            initStatus: 'Selecciona la fecha', isRTL: false
        };
        $.datepicker.setDefaults($.datepicker.regional['es']);      
          $("#<%= dtRequiredDate.ClientID %>").datepicker();
      });

    

</script>   
</asp:Content> 

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
      
          <asp:Button Text="Listado" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server" style="background-color: #006699;text-align: center; font-weight: 600; color:  #FFFFFF;"
                    ForeColor="Black"  OnClick="Tab1_Click" />
        <asp:Button Text="Detalle" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server" style="background-color: #006699;text-align: center; font-weight: 600; color:  #FFFFFF;"
                    OnClick="Tab2_Click" />
 
   <asp:MultiView ID="MainView" runat="server">
        <%--    LISTADO  INICIO >--%>

        <asp:View ID="View1" runat="server">
           <h2 >Listado de Pedidos Pendiente de Confirmacion </h2> 
       <div class="box box-primary">
               <div class="row"> 
                    <div class="col-md-12"> 
                      <div class="box-body">                       
                         <table id="gru4" >
                         <tr>
                          <th> <asp:radiobuttonlist id="DirectionList" runat="server" class="input-control frmModal col-sm-4 col-md-3 " height="20px"  FONT-SIZE="10pt" width="150" RepeatDirection="Horizontal"> <asp:listitem selected="true">Nombre/Razon Social</asp:listitem>  </asp:radiobuttonlist>  </th>
                          <th> <asp:TextBox ID="txtBuscar" runat="server" Text="" CssClass="input-control frmModal col-sm-4 col-md-3" width="550" FONT-SIZE="12pt" AutoPostBack="True" autocomplete="off" MaxLength="9" OnLoad="txtBuscar_Load"></asp:TextBox>  </th>
                          <th> <asp:Button ID="ButtBuscar" runat="server"   class="btn ink-reaction btn-raised btn-primary"  Height="35px" Text="Buscar" OnClick="ButtBuscar_Click"  /> </th>
                          </tr>
                        </table> 
                       </div> 
                      </div>

              </div>
        </div>

            <div class="modal-content">  
                <div class="grid-wrap">
                 <table class="table table-striped grid-table">
                     <asp:GridView ID="GridView1"  runat="server" AllowPaging="true" AutoGenerateColumns="False"
                             CellSpacing="3" CssClass="table table-condensed table-hover table-bordered table-striped" 
                             DataKeyNames="OrderID"  ForeColor="#333333"
                             PageSize="70" text-align="left"            
                             border="1"                           
                             OnPageIndexChanging="GridView1_PageIndexChanging" 
                             EnableSortingAndPagingCallbacks="false"
                             OnRowCommand="GridView1_RowCommand" >
                            <PagerSettings FirstPageText="&nbsp;&nbsp;Primero&nbsp;&nbsp;" LastPageText="&nbsp;&nbsp;Ultimo&nbsp;&nbsp;" Mode="NextPreviousFirstLast" NextPageText="&nbsp;&nbsp;Siguiente&nbsp;&nbsp;" PreviousPageText="&nbsp;&nbsp;Anterior&nbsp;&nbsp;" Visible="False" />
                            <RowStyle BackColor="#F7F6F3"  ForeColor="#333333" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" /> 
                             <HeaderStyle BackColor ="#333333" Font-Bold="True" ForeColor="White" /> <%--color titulo--%>
                            <emptydatatemplate>
                                 ¡No hay registros seleccionados!  
                            </emptydatatemplate>  
                     
                         <Columns>
                           <asp:BoundField DataField="OrderID" HeaderStyle-Width="50px" HeaderText="Nro Orden" SortExpression="OrderID"> <HeaderStyle Width="50px"  />  </asp:BoundField>
                           <asp:BoundField DataField="OrderDate" HeaderStyle-Width="100px" HeaderText="Fecha" SortExpression="OrderDate"> <HeaderStyle Width="100px" />  </asp:BoundField>    
                           <asp:BoundField DataField="ShipName" HeaderStyle-Width="500px" HeaderText="Nombre/Razon Social"  SortExpression="ShipName" > <HeaderStyle Width="500px" /> </asp:BoundField>                            
                           <asp:BoundField DataField="telefono" HeaderStyle-Width="100px" HeaderText="Telefono"  SortExpression="telefono" > <HeaderStyle Width="100px" /> </asp:BoundField>  
                          </Columns>
                         <EditRowStyle BackColor="#999999" />
                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                         </asp:GridView>  

                 </table>
               </div>
           </div>       
           

        </asp:View>
        <%--    DETALLE  >--%>
        <asp:View ID="View2" runat="server">
          <asp:TextBox runat="server" ID="txtId"  ></asp:TextBox>           
       <section class="content" >
  
            <h2 >

                  <asp:Label runat="server" class="control-label" ID="Label3"  style=" color: #000000 " Text="" ></asp:Label> 
            </h2 >
              
           <div class="modal-content">  
                <div class="grid-wrap">
                 <table class="table table-striped grid-table">
                      <asp:GridView ID="GridView2"  runat="server" AllowPaging="true" AutoGenerateColumns="False"
                             CellSpacing="3" CssClass="table table-condensed table-hover table-bordered table-striped" 
                             DataKeyNames="OrderID"  ForeColor="#333333"
                             PageSize="10" text-align="left"            
                             border="1"                                       
                             EnableSortingAndPagingCallbacks="false" >
                            <PagerSettings FirstPageText="&nbsp;&nbsp;Primero&nbsp;&nbsp;" LastPageText="&nbsp;&nbsp;Ultimo&nbsp;&nbsp;" Mode="NextPreviousFirstLast" NextPageText="&nbsp;&nbsp;Siguiente&nbsp;&nbsp;" PreviousPageText="&nbsp;&nbsp;Anterior&nbsp;&nbsp;" Visible="False" />
                            <RowStyle BackColor="#F7F6F3"  ForeColor="#333333" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" /> 
                             <HeaderStyle BackColor ="#333333" Font-Bold="True" ForeColor="White" /> <%--color titulo--%>
                            <emptydatatemplate>
                                 ¡No hay registros seleccionados!  
                            </emptydatatemplate>  
                     
                         <Columns>
                          <asp:BoundField DataField="ProductID" HeaderStyle-Width="60px" HeaderText="Codigo" SortExpression="ProductID">  <HeaderStyle Width="60px" />
                          </asp:BoundField>  
                           <asp:BoundField DataField="ProductName" HeaderStyle-Width="500px" HeaderText="Descripcion" SortExpression="ProductName">  <HeaderStyle Width="500px" />
                          </asp:BoundField>
                          <asp:BoundField DataField="Quantity" HeaderStyle-Width="100px" HeaderText="Cantidad" SortExpression="Quantity"> <HeaderStyle Width="100px" />
                          </asp:BoundField>
                          <asp:BoundField DataField="UnitPrice" HeaderStyle-Width="100px" HeaderText="Precio" SortExpression="UnitPrice" >
                          <HeaderStyle Width="100px" />
                          </asp:BoundField>
                          <asp:BoundField DataField="total" HeaderStyle-Width="100px" HeaderText="Total" SortExpression="total" >
                          <HeaderStyle Width="100px" />
                          </asp:BoundField>
                         </Columns>
                         <EditRowStyle BackColor="#999999" />
                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                         </asp:GridView>  
                 </table>
               </div>
           </div> 
        <div class="box box-primary">
               <div class="row">  
                   <div class="col-md-4"> 
                      <div class="box-body">    
                     </div>
                   </div>    
              </div>
        </div>     
          <div class="box box-primary">
               <div class="row">  
                                
                  <div class="col-md-4"> 
                      <div class="box-body">      
                     <asp:Label runat="server" class="control-label" ID="Label12"  style=" color: #a5a1a1 " Text="FECHA CONFIRMACION" ></asp:Label>         
                       <asp:TextBox ID="dtRequiredDate" runat="server" CssClass="form-control" data-inputmask="'alias': 'dd/MM/yyyy'" data-mask=""  autocomplete="off" TabIndex="1" ></asp:TextBox>
       
                     </div> 
                  </div> 
                 <div class="col-md-4"> 
                      <div class="box-body">      
                     <asp:Label runat="server" class="control-label" ID="Label1"  style=" color: #a5a1a1 " Text="CONFIRMADO" ></asp:Label>
                      <asp:CheckBox ID="checkBox_estado" runat="server"  CssClass="form-control"   TabIndex="2"/>         
                      
                     </div> 
                  </div> 
                  <div class="col-md-4"> 
                      <div class="box-body">      
                         <asp:Label runat="server" class="control-label" ID="Label20"  style=" color: #a5a1a1 " Text="TOTAL IMPORTE" ></asp:Label>         
                         <asp:TextBox ID="txtga_totimporte" runat="server" Text="" CssClass="form-control"   TabIndex="3" ></asp:TextBox>
                      </div>  
                  </div>           
 
                                                                       
               </div>
          </div>     
          <div class="box box-primary">
             <div class="row">  
                  <div class="col-md-12"> 
                      <div class="box-body">      
                      <asp:Label runat="server" class="control-label" ID="Label30"  style=" color: #a5a1a1 " Text="COMENTARIO" ></asp:Label>         
                         <asp:TextBox ID="txtga_Motivo" runat="server" Text="" CssClass="form-control"   autocomplete="off" MaxLength="500" TabIndex="50" ></asp:TextBox>
                      </div> 
                      
                  </div>   
             </div>
            
        </div>                                  
           <div class="col-md-6"> 
               <div class="box-body">    
                  <asp:Label runat="server" class="control-label" ID="Label33"  style=" color: #FFFFFF " Text="...."   ></asp:Label>                            
                     <table id="gru2" >
                        <tr>
                         <th> <asp:Button ID="btnGuardar" runat="server" Text="Grabar"  Height="28px" Width="85" Style="color: #FFFFFF; background: #2CD817" OnClick="btnGuardar_Click" /> </th>  
                         <th> <asp:Button ID="btnCancelar" runat="server" Text="Salir"  Height="28px" Width="85" style=" color: #FFFFFF ; Background :#D35400"  OnClick="btnCancelar_Click" /> </th>                                         
                                  
                        </tr>
                     </table> 
               </div> 
            </div>      
                                                                                            
       </section> 

        </asp:View>

 
     
   </asp:MultiView>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

</asp:Content>