package form;

import model.Instrument;
import model.Membre;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import model.Statut;
import model.Utilisateur;

public class FormConnexion {

    private String resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public void setResultat(String resultat) {
        this.resultat = resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public void setErreurs(Map<String, String> erreurs) {
        this.erreurs = erreurs;
    }

    //méthode de validation du champ de saisie nom
    private void validationLogin( String username ) throws Exception {
        if ( username == null ) {
            throw new Exception( "Erreur" );
        }
    }

    private void validationMDP( String motDePasse) throws Exception {
        if ( motDePasse == null) {
            throw new Exception( "Erreur" );
        }
    }
    
    private void setErreur( String champ, String message ) {
        erreurs.put(champ, message );
    }

    private static String getDataForm(HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }
    }


    public Utilisateur connexion(HttpServletRequest request ) {

        Utilisateur unUtilisateur  = new Utilisateur();

        //récupération dans des variables des données saisies dans les champs de formulaire
        String login = getDataForm( request, "identifiant" );
        String mdp = getDataForm( request, "mdp");
        
        System.out.println("login form" + login);

        try {
            validationLogin( login );
        } catch ( Exception e ) {
            setErreur( "identifiant", e.getMessage() );
        }
         unUtilisateur.setIdentifiant(login);
         
        try {
            validationMDP( mdp );
        } catch ( Exception e ) {
            setErreur( "mdp", e.getMessage() );
        }
        unUtilisateur.setMdp(mdp);
        
        return unUtilisateur;
        
        
    }
}
