/*
 * generated by Xtext 2.38.0
 */
package org.xtext.example.botch.ui.tests;

import com.google.inject.Injector;
import org.eclipse.xtext.testing.IInjectorProvider;
import org.xtext.botch.ui.internal.BotchActivator;

public class B0tchUiInjectorProvider implements IInjectorProvider {

	@Override
	public Injector getInjector() {
		return BotchActivator.getInstance().getInjector("org.xtext.example.botch.B0tch");
	}

}
