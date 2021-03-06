/*******************************************************************************
 * Copyright (c) 2017 Weasis Team.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Nicolas Roduit - initial API and implementation
 *     Tomas Skripcak - initial API and implementation
 ******************************************************************************/

package org.weasis.dicom.rt;

import java.awt.Color;
import java.util.List;
import java.util.Map;

public class IsoDose {

    private int level;
    private String name;
    private double absoluteDose;
    private double thickness;

    private Color color;
    private Map<KeyDouble, List<Contour>> planes;

    public IsoDose(int level, Color color, String name, double planDose) {
        this.level = level;
        this.color = color;
        this.name = name;
        this.absoluteDose = ((this.level) * planDose) / 100.0;
    }

    public int getLevel() {
        return this.level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Color getColor() {
        return this.color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public double getAbsoluteDose() {
        return this.absoluteDose;
    }

    public double getThickness() {
        return this.thickness;
    }

    public void setThickness(double value) {
        this.thickness = value;
    }

    public Map<KeyDouble, List<Contour>> getPlanes() {
        return this.planes;
    }

    public void setPlanes(Map<KeyDouble, List<Contour>> contours) {
        this.planes = contours;
    }

    public String getLabel() {
        String result = this.level + " % / " + String.format("%.6g", this.absoluteDose) + " cGy";
        if (this.name != null && !this.name.equals("")) {
            result += " [" + this.name + "]";
        }
        return result;
    }

    @Override
    public String toString() {
        return getLabel();
    }
    
}
