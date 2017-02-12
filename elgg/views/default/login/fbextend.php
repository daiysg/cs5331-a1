<?php
$facebook_signin = '<button style = "height:60px; width: 120px;  background: transparent; border: none !important;" onclick="fbLogin()" ><fb:login-button scope="public_profile,email" onlogin="checkLoginState();" ></fb:login-button></button>';
$facebook_signin .= '<div id="status"></div>';
echo $facebook_signin;
?>

<script>
    function fbLogin() {
        document.cookie = "FB_LOGIN=true";
    }

    function statusChangeCallback(response) {
        //console.log('statusChangeCallback: status - ' + response.status);

        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            var access_token = response.authResponse.accessToken;

            FB.api('/me', function (response) {
                //console.log("function me: ");
                //console.log(response);
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
                            FB.logout(function (response) {
                            });
                            window.location.reload(true);
                        }
                    }
                });
            });
        } else {
        }
    }

    function checkLoginState() {
        console.log('fb check login state');
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
        //FB.getLoginStatus(function(response) {
        //statusChangeCallback(response);
        //});
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


