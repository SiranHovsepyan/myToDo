document.getElementById("testBtn").onclick = function () {
    let elementById = document.getElementById("test");
    elementById.style.backgroundColor = "blue";
}


document.getElementById("loginBtn").onclick = function (e) {
    let loginEmail = document.getElementById("loginEmail");
    let loginPass = document.getElementById("loginPass");
    let message = "";
    if (loginEmail.value == null || loginEmail.value.length < 3) {
        message += "Email is required";
    }
    if (loginPass.value == null || loginPass.value.length < 6) {
        message += "Password is Invalid!!!";
    }

    if (message !== "") {
        e.preventDefault();
        document.getElementById("errorMessage").innerHTML = message;
    }

}