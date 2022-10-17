package form;

import model.Instrument;
import model.Membre;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import model.Statut;
import model.Utilisateur;

public class FormInscription {

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
    private void validationUsername( String username ) throws Exception {
        if ( username == null && username.length() < 3 ) {
            throw new Exception( "Le nom d'utilisateur doit contenir au moins 3 caractères." );
        }
    }

    private void validationMotDePasse( String motDePasse) throws Exception {
        if ( motDePasse == null && motDePasse.length() <6  ) {
            throw new Exception( "le mot de passe doit contenir au moins 6 caractères." );
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

    // creation d'un objet utilisateur (et son genre) à partir des données saisies dans le formulaire
    public Utilisateur inscription(HttpServletRequest request ) {

        Utilisateur unUtilisateur  = new Utilisateur();

        //récupération dans des variables des données saisies dans les champs de formulaire
        String username = getDataForm( request, "username" );
        String motDePasse = getDataForm( request, "password");

        try {
            validationUsername( username );
        } catch ( Exception e ) {
            setErreur( "username", e.getMessage() );
        }
        unUtilisateur.setIdentifiant(username);
         
        try {
            validationMotDePasse( motDePasse );
        } catch ( Exception e ) {
            setErreur( "password", e.getMessage() );
        }
        unUtilisateur.setMdp(motDePasse);
        
        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
        System.out.println("resultat erreurs="+resultat);

        // hydratation de l'objet membre avec les variables valorisées ci-dessus
        
        return unUtilisateur ;
    }
    
    
}
