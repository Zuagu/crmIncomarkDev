<%-- 
    Document   : croquis-oficina
    Created on : 7/11/2017, 03:56:28 PM
    Author     : Luis Cortez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Croquis Oficina SISCA MTY</title>

        <style>
            td{
                width: 46px;
                height: 23px;
                font-family: 'Helvetica';
                font-size: 11px; 
                border: solid 1px #C9C9C9;
            }

            td.nada{
                border:none;
            }

            td.muro{
                border:none;
                background: #CCCCCC;
                cursor: not-allowed;
            }

            td.estacion{
                background: #FFFFCC;
                cursor:pointer;
                opacity: .6;
            }
            td.estacion:hover{
                background: #F8CD55;
                cursor:pointer;
                opacity: 1;
            }
        </style>
    </head>

    <body style="background-image: url('images/background-cliente.png')">

        <div style="text-align: center;margin: 0px auto;">
            <table class="sombra" style="margin: 0px auto;border: solid 2px black;background: #FFF;">
                <tbody>
                    <tr>
                        <td class="muro">MURO</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td style="border-left: solid 2px black;" class="estacion">Ext. 141</td>
                        <td class="estacion">Ext. 142</td>
                        <td class="estacion">Ext. 143</td>
                        <td class="estacion">Ext. 144</td>
                        <td class="estacion">Ext. 145</td>
                        <td class="muro">MURO</td>
                        <td class="estacion">Ext. 146</td>
                        <td class="estacion">Ext. 147</td>
                        <td class="estacion">Ext. 148</td>
                        <td class="estacion">Ext. 149</td>
                        <td class="estacion">Ext. 150</td>
                    </tr>
                    <tr>
                        <td class="estacion" title="C. P. Itzel Reyes">Ext. 207</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td style="border-left: solid 2px black;" class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                    </tr>
                    <tr>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td style="border-left: solid 2px black;" class="estacion">Ext. 159</td>
                        <td class="estacion">Ext. 158</td>
                        <td class="estacion">Ext. 157</td>
                        <td class="estacion">Ext. 156</td>
                        <td class="estacion">Ext. 155</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="estacion">Ext. 154</td>
                        <td class="estacion">Ext. 153</td>
                        <td class="estacion">Ext. 152</td>
                        <td class="estacion">Ext. 151</td>
                    </tr>
                    <tr>
                        <td style="border-bottom: solid 2px black;" class="nada"></td>
                        <td style="border-bottom: solid 2px black;" class="nada"></td>
                        <td class="nada"></td>
                        <td style="border-left: solid 2px black;" class="estacion">Ext. 160</td>
                        <td class="estacion">Ext. 161</td>
                        <td class="estacion">Ext. 162</td>
                        <td class="estacion">Ext. 163</td>
                        <td class="estacion">Ext. 164</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="estacion">Ext. 165</td>
                        <td class="estacion">Ext. 166</td>
                        <td class="estacion">Ext. 167</td>
                        <td class="estacion">Ext. 168</td>
                    </tr>
                    <tr>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td style="border-left: solid 2px black;" class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                    </tr>
                    <tr>
                        <td class="estacion" title="C. P. Nancy Reyes">Ext. 206</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td style="border-left: solid 2px black;" class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="muro">MURO</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="estacion">Ext. 171</td>
                        <td class="estacion">Ext. 170</td>
                        <td class="estacion">Ext. 169</td>
                    </tr>
                    <tr>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td style="border-left: solid 2px black;" class="nada"></td>
                        <td rowspan="2" class="estacion" style="border-bottom: solid 2px black;" title="Nelly Castillo">Ext. 204</td>
                        <td rowspan="2" class="estacion" style="border-bottom: solid 2px black;" title='Jorge Jimenez'>Ext. 205</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="estacion">Ext. 172</td>
                        <td class="estacion">Ext. 173</td>
                        <td class="estacion">Ext. 174</td>
                    </tr>
                    <tr>
                        <td class="nada" style="border-bottom: solid 2px black;"></td>
                        <td class="nada" style="border-bottom: solid 2px black;"></td>
                        <td class="nada"></td>
                        <td class="nada" style="border-bottom: solid 2px black;"></td>
                        <td class="nada" style="border-bottom: solid 2px black;"></td>
                        <td class="nada" style="border-bottom: solid 2px black;"></td>
                        <td class="nada" style="border-bottom: solid 2px black;"></td>
                        <td class="nada"></td>
                        <td class="nada" style="border-bottom: solid 2px black;"></td>
                        <td class="nada" style="border-bottom: solid 2px black;"></td>
                        <td class="nada" style="border-bottom: solid 2px black;"></td>
                        <td style="border-bottom: solid 2px black;" class="nada"></td>
                    </tr>
                    <tr>
                        <td class="nada"></td>
                        <td class="estacion">Ext. 111</td>
                        <td class="nada"></td>
                        <td class="estacion">Ext. 121</td>
                        <td class="estacion">Ext. 122</td>
                        <td class="estacion">Ext. 123</td>
                        <td class="estacion">Ext. 124</td>
                        <td class="estacion">Ext. 125</td>
                        <td class="estacion">Ext. 126</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                    </tr>
                    <tr>
                        <td class="nada"></td>
                        <td class="estacion">Ext. 112</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                    </tr>
                    <tr>
                        <td class="nada"></td>
                        <td class="estacion">Ext. 113</td>
                        <td class="nada"></td>
                        <td class="estacion">Ext. 135</td>
                        <td class="estacion">Ext. 134</td>
                        <td class="estacion">Ext. 133</td>
                        <td class="estacion">Ext. 132</td>
                        <td class="estacion">Ext. 131</td>
                        <td rowspan="2" class="muro">MURO</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                    </tr>
                    <tr>
                        <td class="nada"></td>
                        <td class="estacion">Ext. 114</td>
                        <td class="nada"></td>
                        <td class="estacion">Ext. 136</td>
                        <td class="estacion">Ext. 137</td>
                        <td class="estacion">Ext. 138</td>
                        <td class="estacion">Ext. 139</td>
                        <td class="estacion">Ext. 140</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                    </tr>
                    <tr>
                        <td class="nada"></td>
                        <td class="estacion">Ext. 115</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                    </tr>
                    <tr>
                        <td class="nada"></td>
                        <td class="estacion">Ext. 116</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                    </tr>
                    <tr>
                        <td class="estacion">Ext. 107</td>
                        <td class="estacion">Ext. 117</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                    </tr>
                    <tr>
                        <td class="nada"></td>
                        <td class="estacion">Ext. 118</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td rowspan="2" class="estacion" title="Homero Malacara">Ext. 209</td>
                        <td class="nada"></td>
                        <td rowspan="2" class="estacion">Cap</td>
                        <td class="nada"></td>
                        <td rowspan="2" class="estacion" title="Francisco Hernandez">Ext. 208</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                    </tr>
                    <tr>
                        <td class="estacion" title='Dinorah Aguirre'>Ext. 109</td>
                        <td class="estacion">Ext. 119</td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                        <td class="nada"></td>
                    </tr>
                </tbody>
            </table>

        </div>

    </body>
</html>
