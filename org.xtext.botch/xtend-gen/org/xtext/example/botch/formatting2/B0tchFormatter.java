/**
 * generated by Xtext 2.38.0
 */
package org.xtext.example.botch.formatting2;

import com.google.inject.Inject;
import java.util.Arrays;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.formatting2.AbstractFormatter2;
import org.eclipse.xtext.formatting2.IFormattableDocument;
import org.eclipse.xtext.resource.XtextResource;
import org.eclipse.xtext.xbase.lib.Extension;
import org.eclipse.xtext.xbase.lib.XbaseGenerated;
import org.xtext.example.botch.services.B0tchGrammarAccess;

@SuppressWarnings("all")
public class B0tchFormatter extends AbstractFormatter2 {
  @Inject
  @Extension
  private B0tchGrammarAccess _b0tchGrammarAccess;

  protected void _format(final /* Add */Object add, @Extension final IFormattableDocument document) {
    throw new Error("Unresolved compilation problems:"
      + "\nx cannot be resolved"
      + "\nformat cannot be resolved"
      + "\ny cannot be resolved"
      + "\nformat cannot be resolved");
  }

  protected void _format(final /* Minus */Object minus, @Extension final IFormattableDocument document) {
    throw new Error("Unresolved compilation problems:"
      + "\nx cannot be resolved"
      + "\nformat cannot be resolved"
      + "\ny cannot be resolved"
      + "\nformat cannot be resolved");
  }

  @XbaseGenerated
  public void format(final Object add, final IFormattableDocument document) {
    if (add instanceof XtextResource) {
      _format((XtextResource)add, document);
      return;
    } else if (add instanceof EObject) {
      _format((EObject)add, document);
      return;
    } else if (add == null) {
      _format((Void)null, document);
      return;
    } else if (add != null) {
      _format(add, document);
      return;
    } else if (add != null) {
      _format(add, document);
      return;
    } else {
      throw new IllegalArgumentException("Unhandled parameter types: " +
        Arrays.<Object>asList(add, document).toString());
    }
  }
}
