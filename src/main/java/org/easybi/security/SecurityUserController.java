package org.easybi.security;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/securityusers")
@Controller
@RooWebScaffold(path = "securityusers", formBackingObject = SecurityUser.class)
public class SecurityUserController {

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid SecurityUser securityUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, securityUser);
            return "securityusers/create";
        }
        String hashedPassword;
        try {
            hashedPassword = sha256(securityUser.getPassword());
            securityUser.setPassword(hashedPassword);
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        uiModel.asMap().clear();
        securityUser.persist();
        return "redirect:/securityusers/" + encodeUrlPathSegment(securityUser.getId().toString(), httpServletRequest);
    }

    private String sha256(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        digest.update(password.getBytes("UTF-8"));
        byte[] hash = digest.digest();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < hash.length; i++) {
            sb.append(Integer.toString((hash[i] & 0xff) + 0x100, 16).substring(1));
        }
        return sb.toString();
    }
}
