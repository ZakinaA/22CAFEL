package form;

import model.Instrument;
import model.Membre;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import model.Statut;

public class FormMembre {

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
    private void validationNom( String nom ) throws Exception {
        if ( nom != null && nom.length() < 3 ) {
            throw new Exception( "Le nom de membre doit contenir au moins 3 caractères." );
        }
    }

    private void validationPrenom( String prenom) throws Exception {
        if ( prenom != null && prenom.length() <3  ) {
            throw new Exception( "le prenom de membre doit contenir au moins 3 caractères." );
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

    // creation d'un objet membre (et son genre) à partir des données saisies dans le formulaire
    public Membre ajouterMembre(HttpServletRequest request ) {

        Membre unMembre  = new Membre();

        //récupération dans des variables des données saisies dans les champs de formulaire
        String nom = getDataForm( request, "nom" );
        String prenom = getDataForm( request, "prenom");
        int idInstru = Integer.parseInt(getDataForm( request, "idInstru" ));
        int idStatut = Integer.parseInt(getDataForm( request, "idStatut" ));

        try {
            validationNom( nom );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
         unMembre.setNom(nom);
         
        try {
            validationPrenom( prenom );
        } catch ( Exception e ) {
            setErreur( "prenom", e.getMessage() );
        }
        unMembre.setPrenom(prenom);
        
        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
        System.out.println("resultat erreurs="+resultat);

        // hydratation de l'objet membre avec les variables valorisées ci-dessus

        Instrument lInstru = new Instrument();
        lInstru.setId(idInstru);
        unMembre.setUnInstrument(lInstru);
        
        Statut leStatut = new Statut();
        leStatut.setId(idStatut);
        unMembre.setUnStatut(leStatut);
        
        return unMembre ;
    }
}
