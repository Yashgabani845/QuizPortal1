<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="QuizPortal.signup" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Sign Up</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate-unobtrusive/3.2.11/jquery.validate.unobtrusive.min.js"></script>
</head>
<body>
    <form id="login_form" runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-header text-center">
                            <h2>Sign Up</h2>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <asp:Label ID="lblName" runat="server" Text="Name:" AssociatedControlID="nameId" CssClass="font-weight-bold" />
                                <asp:TextBox ID="nameId" runat="server" CssClass="form-control" />
                                <asp:RequiredFieldValidator
                                    ID="rfvName"
                                    runat="server"
                                    ControlToValidate="nameId"
                                    ErrorMessage="Name is required"
                                    ForeColor="Red"
                                    CssClass="error"
                                    Display="Dynamic" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblUsername" runat="server" Text="Username:" AssociatedControlID="usernameId" CssClass="font-weight-bold" />
                                <asp:TextBox ID="usernameId" runat="server" CssClass="form-control" />
                                <asp:RequiredFieldValidator
                                    ID="rfvUsername"
                                    runat="server"
                                    ControlToValidate="usernameId"
                                    ErrorMessage="Username is required"
                                    ForeColor="Red"
                                    CssClass="error"
                                    Display="Dynamic" />
                                <asp:RegularExpressionValidator
                                    ID="revUsername"
                                    runat="server"
                                    ControlToValidate="usernameId"
                                    ValidationExpression="^(?=.*\d)[a-zA-Z\d]{7,}$"
                                    ErrorMessage="Username must be at least 7 characters long and contain at least 1 number. No special characters allowed."
                                    ForeColor="Red"
                                    CssClass="error"
                                    Display="Dynamic" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblPassword" runat="server" Text="Password:" AssociatedControlID="passwordId" CssClass="font-weight-bold" />
                                <asp:TextBox ID="passwordId" runat="server" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator
                                    ID="rfvPassword"
                                    runat="server"
                                    ControlToValidate="passwordId"
                                    ErrorMessage="Password is required"
                                    ForeColor="Red"
                                    CssClass="error"
                                    Display="Dynamic" />
                                <asp:RegularExpressionValidator
                                    ID="revPassword"
                                    runat="server"
                                    ControlToValidate="passwordId"
                                    ValidationExpression="^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{7,}$"
                                    ErrorMessage="Password must be at least 7 characters long and contain at least 1 uppercase letter, 1 number, and 1 special character."
                                    ForeColor="Red"
                                    CssClass="error"
                                    Display="Dynamic" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblRole" runat="server" Text="Role:" AssociatedControlID="roleId" CssClass="font-weight-bold" />
                                <asp:DropDownList ID="roleId" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Please select role" Value="-1" />
                                    <asp:ListItem Text="Admin" Value="Admin" />
                                    <asp:ListItem Text="User" Value="User" />
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator
                                    ID="rfvRole"
                                    runat="server"
                                    ControlToValidate="roleId"
                                    InitialValue="-1"
                                    ErrorMessage="Please select a role"
                                    ForeColor="Red"
                                    CssClass="error"
                                    Display="Dynamic" />
                            </div>
                            <div class="form-group">
                                <asp:Button
                                    ID="signupButton"
                                    runat="server"
                                    Text="Sign Up"
                                    CssClass="btn btn-primary btn-block"
                                    OnClick="signup_button_click" />
                            </div>
                            <div class="form-group text-center">
                                <div style="color: Black; text-align:center;">Already have an account? <a href="login.aspx" style="color: Blue;">Log In </a></div> 
                            </div>
                            <div class="form-group">
                                <asp:Label ID="errorMsg" runat="server" ForeColor="Red" CssClass="text-center d-block bg-light p-2 border border-danger rounded" ></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>