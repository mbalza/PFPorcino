<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
    <g:javascript library="prefixfree.min" />
    <style>

body {
    background: #ffffff;
    background: -moz-linear-gradient(top,  #ffffff 1%, #bebdc1 100%);
    background: -webkit-linear-gradient(top,  #ffffff 1%,#bebdc1 100%);
    background: linear-gradient(to bottom,  #ffffff 1%,#bebdc1 100%);
    color: #666666;
    font-family: 'RobotoDraft', 'Roboto', sans-serif;
    font-size: 14px;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

/* Rerun */
.rerun {
    margin: 0 0 30px;
    text-align: center;
}
.rerun a {
    cursor: pointer;
    display: inline-block;
    background: #dfa492;
    border-radius: 3px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
    padding: 10px 20px;
    color: #ffffff;
    text-decoration: none;
    -webkit-transition: 0.3s ease;
    transition: 0.3s ease;
}
.rerun a:hover {
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
}

/* Scroll To Bottom */
#codepen, #portfolio {
    position: fixed;
    bottom: 30px;
    right: 30px;
    background: #DFA492;
    width: 56px;
    height: 56px;
    border-radius: 100%;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
    -webkit-transition: 0.3s ease;
    transition: 0.3s ease;
    color: #ffffff;
    text-align: center;
}
#codepen i, #portfolio i {
    line-height: 56px;
}
#codepen:hover, #portfolio:hover {
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
}

/* CodePen */
#portfolio {
    bottom: 96px;
    right: 36px;
    background: #DFA492;
    width: 44px;
    height: 44px;
    -webkit-animation: buttonFadeInUp 1s ease;
    animation: buttonFadeInUp 1s ease;
}
#portfolio i {
    line-height: 44px;
}

/* Container */
.container {
    position: relative;
    max-width: 460px;
    width: 100%;
    margin: 0 auto 100px;
}
.container.active .card:first-child {
    background: #f2f2f2;
    margin: 0 15px;
}
.container.active .card:nth-child(2) {
    background: #fafafa;
    margin: 0 10px;
}

/* Card */
.card {
    position: relative;
    background: #ffffff;
    border-radius: 5px;
    padding: 60px 0 40px 0;
    box-sizing: border-box;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
    -webkit-transition: .3s ease;
    transition: .3s ease;
    /* Title */
    /* Inputs */
    /* Button */
    /* Footer */
    /* Alt Card */
}
.card:first-child {
    background: #fafafa;
    height: 10px;
    border-radius: 5px 5px 0 0;
    margin: 0 10px;
    padding: 0;
}
.card .title {
    position: relative;
    z-index: 1;
    border-left: 5px solid #DFA492;
    margin: 0 0 35px;
    padding: 10px 0 10px 50px;
    color:#DFA492;
    font-size: 32px;
    font-weight: 600;
    text-transform: uppercase;
}

.notinvalid input:invalid:focus{
    -moz-box-shadow: none;
    -webkit-box-shadow: none;
    box-shadow: none;
}

.card .input-container {
    position: relative;
    margin: 0 60px 50px;
}
.card .input-container input {
    outline: none;
    z-index: 1;
    position: relative;
    background: none;
    width: 100%;
    height: 54px;
    border: 0;
    color: #212121;
    font-size: 20px;
    font-weight: 400;
}
.card .input-container input:focus ~ label {
    color: #9d9d9d;
    -webkit-transform: translate(-12%, -50%) scale(0.75);
    transform: translate(-12%, -50%) scale(0.75);
}
.card .input-container input:focus ~ .bar:before, .card .input-container input:focus ~ .bar:after {
    width: 50%;
}
.card .input-container input:valid ~ label {
    color: #9d9d9d;
    -webkit-transform: translate(-12%, -50%) scale(0.75);
    transform: translate(-12%, -50%) scale(0.75);
}
.card .input-container label {
    position: absolute;
    top: 0;
    left: 0;
    color: #757575;
    font-size: 24px;
    font-weight: 300;
    line-height: 60px;
    -webkit-transition: 0.2s ease;
    transition: 0.2s ease;
}
.card .input-container .bar {
    position: absolute;
    left: 0;
    bottom: 0;
    background: #757575;
    width: 100%;
    height: 1px;
}
.card .input-container .bar:before, .card .input-container .bar:after {
    content: '';
    position: absolute;
    background: #DFA492;
    width: 0;
    height: 2px;
    -webkit-transition: .2s ease;
    transition: .2s ease;
}
.card .input-container .bar:before {
    left: 50%;
}
.card .input-container .bar:after {
    right: 50%;
}
.card .button-container {
    margin: 0 60px;
    text-align: center;
}
.card .button-container button {
    outline: 0;
    cursor: pointer;
    position: relative;
    display: inline-block;
    background: 0;
    width: 240px;
    border: 2px solid #e3e3e3;
    padding: 20px 0;
    font-size: 24px;
    font-weight: 600;
    line-height: 1;
    text-transform: uppercase;
    overflow: hidden;
    -webkit-transition: .3s ease;
    transition: .3s ease;
}
.card .button-container button span {
    position: relative;
    z-index: 1;
    color: #ddd;
    -webkit-transition: .3s ease;
    transition: .3s ease;
}
.card .button-container button:before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    display: block;
    background: #DFA492;
    width: 30px;
    height: 30px;
    border-radius: 100%;
    margin: -15px 0 0 -15px;
    opacity: 0;
    -webkit-transition: .3s ease;
    transition: .3s ease;
}
.card .button-container button:hover, .card .button-container button:active, .card .button-container button:focus {
    border-color: #DFA492;
}
.card .button-container button:hover span, .card .button-container button:active span, .card .button-container button:focus span {
    color: #DFA492;
}
.card .button-container button:active span, .card .button-container button:focus span {
    color: #ffffff;
}
.card .button-container button:active:before, .card .button-container button:focus:before {
    opacity: 1;
    -webkit-transform: scale(10);
    transform: scale(10);
}
.card .footer {
    margin: 40px 0 0;
    color: #d3d3d3;
    font-size: 24px;
    font-weight: 300;
    text-align: center;
}
.card .footer a {
    color: inherit;
    text-decoration: none;
    -webkit-transition: .3s ease;
    transition: .3s ease;
}
.card .footer a:hover {
    color: #bababa;
}

/* Keyframes */
@-webkit-keyframes buttonFadeInUp {
    0% {
        bottom: 30px;
        opacity: 0;
    }
}
@keyframes buttonFadeInUp {
    0% {
        bottom: 30px;
        opacity: 0;
    }
}

</style>
</head>

<body>
<div class="container">
    <div class="row">

        <!-- Mixins-->
        <!-- Pen Title-->
        <div class="container">
            <div class="card"></div>
            <div class="card">
                <h1 class="title">Iniciar Sesión</h1>
                <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
                    <div class="input-container notinvalid">
                        <input type="text" name='j_username' id="username" required="required"/>
                        <label for="username">Usuario</label>
                        <div class="bar"></div>
                    </div>
                    <div class="input-container notinvalid">
                        <input type="password" name='j_password' id="password" required="required"/>
                        <label for="password">Contraseña</label>
                        <div class="bar"></div>
                    </div>
                    <div class="button-container">
                        <button type="submit" id="submit"><span>Ingresar</span></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>

</body>
</html>
