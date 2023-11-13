document.write(`
    <footer class="d-flex flex-wrap justify-content-between py-2 border-top fixed-bottom" style="background-color:aliceblue; padding: 1em;">
        <div class="col-md-4 d-flex" style="width:fit-content; margin:auto;">
            <a class="text-muted" href="https://github.com/BraG29/turismo-uy-desktop">
                <span class="mb-3 mb-md-0">2023 Turismo.UY</span>
                &nbsp;&nbsp;&nbsp;
                <span id="clock"></span>
            </a>
        </div>
        <ul class="nav col-md-4 justify-content-end list-unstyled d-flex" style="width:fit-content; margin:auto;">
            <li class"ms-3">
                <a class="nav-link" href="${contextPath}/logout">
                    <button class="btn btn-outline-danger btn-sm">
                        Cerrar Sesión
                    </button>
                </a>
            </li>    
            <li class="ms-3">
                <a class="text-muted" href="https://github.com/BraG29/turismo-uy-webapp">
                    <img src="assets/images/github_sign.png" width="48px">
                </a>
            </li>
        </ul>
    </footer>
`);