<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Retorno.aspx.cs" Inherits="Web.Retorno" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Dashboard.v15.1.Web, Version=15.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard para o BugMantis</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/waiting.js"></script>

    <script type="text/javascript">
        function reloadDash() {
            dash.ReloadData();
        }

        var msgLoading = "Carregando Dashboard";

        function showLoading() {
            waitingDialog.show(msgLoading);
        }
        function hideLoading() {
            waitingDialog.hide();
        }
    </script>
</head>
<body style="margin-top:51px;">
    <form id="form1" runat="server">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Default.aspx">Dashboard Mantis</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="#" data-toggle="modal" data-backdrop="true" data-target="#modalConfiguracao">Configurar Dashboard</a></li>
                        <li><a href="Default.aspx">Dashboard de todos os casos</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div>
            <dx:ASPxCallbackPanel ID="panel" ClientInstanceName="panel" runat="server" Width="98%" OnCallback="cbpPrincipal_Callback">
                <ClientSideEvents EndCallback="function(s, e) {
	                                                reloadDash();
                                                }
                " />
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <div id="bemvindo" runat="server" class="jumbotron">
                            Bem vindo, configure o dashboard com os valores do banco.
                        </div>
                        <dx:ASPxDashboardViewer ID="dash" ClientInstanceName="dash" runat="server" Width="100%" Height="1500px" Visible="false" DashboardSource="~/xml/mantisRetorno.xml" OnConfigureDataConnection="dbvPrincipal_ConfigureDataConnection">
                            <ClientSideEvents Loaded="function(s, e) {
	                            hideLoading();
                            }"
                                Init="function(s, e) {
	                            showLoading();
                            }" />
                        </dx:ASPxDashboardViewer>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>            
        </div>


        <div class="modal fade" id="modalConfiguracao" data-backdrop="true" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Configuração do dashboard</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-xs-6 form-group">
                                <label>Servidor (MySql)</label>
                                <dx:ASPxTextBox ID="txtServer" runat="server" Width="100%" EnableTheming="true" Native="true" class="form-control"></dx:ASPxTextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 form-group">
                                <label>Porta</label>
                                <dx:ASPxTextBox ID="txtPorta" runat="server" Width="100%" EnableTheming="true" Native="true" class="form-control"></dx:ASPxTextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 form-group">
                                <label>Nome do banco</label>
                                <dx:ASPxTextBox ID="txtBanco" runat="server" Width="100%" EnableTheming="true" Native="true" class="form-control"></dx:ASPxTextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 form-group">
                                <label>Usuário</label>
                                <dx:ASPxTextBox ID="txtUser" runat="server" Width="100%" EnableTheming="true" Native="true" class="form-control"></dx:ASPxTextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 form-group">
                                <label>Senha</label>
                                <dx:ASPxTextBox ID="txtSenha" Password="true" runat="server" Width="100%" EnableTheming="true" Native="true" class="form-control"></dx:ASPxTextBox>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="panel.PerformCallback();">Salvar e gerar</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
