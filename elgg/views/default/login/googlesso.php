<?php
$google_login = '<div class="g-signin2" data-onsuccess="onSignIn" ></div>';
echo $google_login;
?>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript">
    function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();
        console.log('Name: ' + profile.getName());
        console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.

        var response = profile;

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);

        if (response.getEmail() != null && id_token != "") {
            $.ajax({
                url: "/elgg/googlecallback.php",
                data: {
                    userName: response.getName(),
                    email: response.getEmail(),
                    idToken: id_token,
                    userType: '2'
                },
                dataType: "json",
                type: "post",
                success: function (data) {
                    if (data.success == true) {
                        var auth2 = gapi.auth2.getAuthInstance();
                        auth2.signOut().then(function () {
                            console.log('User signed out from google');
                        });
                        window.location.reload(true);
                    }
                }
            });
        } else {
            alert("ERROR when Google LogIn");
        }
    }
    ;
    $(document).ready(function () {
        $("head").append('<meta name="google-signin-scope" content="profile email">');
        $("head").append('<meta name="google-signin-client_id" content="423648320802-i04pigmqtclahsf9m672l2cblafh0o9h.apps.googleusercontent.com">');
    });
</script>

