#!/usr/bin/env dub
/+
dub.sdl:
    name "snippet127"
    dependency "dwt" path="../../../../../../"
    libs \
      "atk-1.0" \
      "cairo" \
      "dl" \
      "fontconfig" \
      "gdk-x11-2.0" \
      "gdk_pixbuf-2.0" \
      "glib-2.0" \
      "gmodule-2.0" \
      "gnomeui-2" \
      "gnomevfs-2" \
      "gobject-2.0" \
      "gthread-2.0" \
      "gtk-x11-2.0" \
      "pango-1.0" \
      "pangocairo-1.0" \
      "X11" \
      "Xcomposite" \
      "Xcursor" \
      "Xdamage" \
      "Xext" \
      "Xfixes" \
      "Xi" \
      "Xinerama" \
      "Xrandr" \
      "Xrender" \
      "Xtst" \
      platform="linux"
+/

/*******************************************************************************
 * Copyright (c) 2000, 2004 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 * D Port:
 *     Thomas Demmer <t_demmer AT web DOT de>
 *******************************************************************************/
module org.eclipse.swt.snippets.Snippet127;

/*
 * Control example snippet: prevent Tab from traversing out of a control
 *
 * For a list of all SWT example snippets see
 * http://www.eclipse.org/swt/snippets/
 */
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.TraverseEvent;
import org.eclipse.swt.events.TraverseListener;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.layout.RowLayout;

import java.lang.all;

void main () {
    Display display = new Display ();
    Shell shell = new Shell (display);
    shell.setLayout(new RowLayout ());
    Button button1 = new Button(shell, SWT.PUSH);
    button1.setText("Can't Traverse");
    button1.addTraverseListener(new class TraverseListener{
        public void keyTraversed(TraverseEvent e) {
            switch (e.detail) {
            case SWT.TRAVERSE_TAB_NEXT:
            case SWT.TRAVERSE_TAB_PREVIOUS:
                e.doit = false;
                break;
            default:
                break;
            }
        }
    });
    Button button2 = new Button (shell, SWT.PUSH);
    button2.setText("Can Traverse");
    shell.pack ();
    shell.open();
    while (!shell.isDisposed ()) {
        if (!display.readAndDispatch ()) display.sleep ();
    }
    display.dispose ();
}

