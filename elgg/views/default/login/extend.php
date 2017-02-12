<?php
$google_login = '<button style = "height:60px; width: 120px;  background: transparent; border: none !important;" onclick="googleLogin()"><div class="g-signin2" data-onsuccess="onSignIn" ></div></button>';

echo $google_login;
?>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript">

    function googleLogin() {
        document.cookie = "GOOGLE_LOGIN=true;path=/";
    }

    function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        var response = profile;

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        //console.log("ID Token: " + id_token);

        if(response.getEmail()!=null && id_token!=""){
            $.ajax({
                url:"/elgg/callback.php",
                data:{
                    userName:response.getName(),
                    email:response.getEmail(),
                    idToken:id_token,
                    userType:'2'
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    if(data.success == true){
                        var auth2 = gapi.auth2.getAuthInstance();
                        auth2.signOut().then(function () {
                            //console.log('User signed out from google');
                        });
                        window.location.reload(true);
                    }
                }
            });
        }else{
            alert("XXX.");
        }
    };
    $(document).ready(function() {
        $("head").append('<meta name="google-signin-scope" content="profile email">');
        $("head").append('<meta name="google-signin-client_id" content="423648320802-i04pigmqtclahsf9m672l2cblafh0o9h.apps.googleusercontent.com">');
    });
</script>

