<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <title>Celtiis_Circles - ${msg("loginAccountTitle")}</title>
    <#elseif section = "form">
        <div class="container">
            <i style="--clr:#93c01f";></i>
            <i style="--clr:#1c3b72";></i>
            <i style="--clr:#fff";></i>
            <div class="Login">
                <img src="${url.resourcesPath}/IMG/celtiis.png" alt="Logo CELTIIS" class="logo" style="width: 31%;">
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <#if !usernameHidden??>
                        <div class="inputBox">
                            <input tabindex="1" id="username" name="username" value="${(login.username!'')}" type="text" placeholder="${msg('usernameOrEmail')}" autofocus autocomplete="off"
                                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                            <#if messagesPerField.existsError('username','password')>
                                <span class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </#if>

                    <div class="inputBox">
                        <input tabindex="2" id="password" name="password" type="password" placeholder="${msg('password')}" autocomplete="off"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                    </div>

                    <div class="inputBox">
                        <input tabindex="4" type="submit" value="${msg('LogIn')}" class="${properties.kcButtonClass!}"/>
                    </div>

                    <div class="link">
                        <#if realm.resetPasswordAllowed>
                            <a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                        </#if>
                        <a href="${url.registrationUrl}">${msg("Register")}</a>
                    </div>
                </form>
            </div>
        </div>


    <#elseif section = "info">
        <#if realm.registrationAllowed && !registrationDisabled??>
            <!--div id="kc-registration-container">
                <span>${msg("noAccount")} <a href="${url.registrationUrl}">${msg("Register")}</a></span>
            </div-->
        </#if>
    <#elseif section = "socialProviders">
        <#if realm.password && social.providers??>
            <div id="kc-social-providers">
                <h4>${msg("identity-provider-login-label")}</h4>
                <ul>
                    <#list social.providers as p>
                        <li>
                            <a href="${p.loginUrl}">${p.displayName!}</a>
                        </li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
        <div class="slideshow">
            <img src="${url.resourcesPath}/IMG/welcome-page-hero.png" alt="Image 1">
            <img src="${url.resourcesPath}/IMG/top-appel.png" alt="Image 2">
            <img src="${url.resourcesPath}/IMG/forfait-mixte.png" alt="Image 3">
            <img src="${url.resourcesPath}/IMG/celtiis-main-hero-2.png" alt="Image 4">
            <img src="${url.resourcesPath}/IMG/celtiis-business-se-connecter-hero.png" alt="Image 5">
            <img src="${url.resourcesPath}/IMG/celtiis-business-colocalisation-hero.png" alt="Image 6">
            <img src="${url.resourcesPath}/IMG/celtiis-business-communiquer-hero.png" alt="Image 7">
        </div>
</@layout.registrationLayout>
