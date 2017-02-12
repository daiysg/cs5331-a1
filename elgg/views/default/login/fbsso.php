<?php
$facebook_signin = '<fb:login-button scope="public_profile,email" onlogin="checkLoginState();" ></fb:login-button>';
$facebook_signin .= '<div id="status"></div>';
echo $facebook_signin;
?>

<script>
    function statusChangeCallback(response) {
        console.log('statusChangeCallback: status - ' + response.status);

        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            var access_token = response.authResponse.accessToken;
            FB.api('/me', function (response) {
                $.ajax({
                    url: "/elgg/fbcallback.php",
                    data: {
                        idToken: access_token,
                        userName: response.name
                    },
                    dataType: "json",
                    type: "post",
                    success: function (data) {
                        if (data.success == true) {
                            window.location.reload(true);
                            FB.logout(function (response) {
                                console.log("User Signed out for FB")
                            });
                        }
                    }
                });
            });
        } else {
        }
    }

    function checkLoginState() {
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function () {
        FB.init({
            appId: '271372279960164',
            xfbml: true,
            version: 'v2.5'
        });
    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>


