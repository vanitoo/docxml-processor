<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="oezin cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:oezin="urn:customs.ru:Information:CustomsDocuments:OEZ_Inventory:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template match="//*[local-name()='OEZ_Inventory']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="oezin:OEZ_Inventory">
      <html>
         <head>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <title>Опись документов к ДТ</title>
            <style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 3; cellspacing: 0; width:100%; border-collapse: collapse; }
					/*td { font-size: 6.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }*/
					td.bold { font-size: 8.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 10.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
					td.border-left { border-left: medium none; border-right: .5pt solid black; }
					td.border { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: medium none; } 
					td.border-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; } 
					td.border-top { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-bottom { border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; } 
					td.border-top-bottom { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; } 
					td.border-top-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-top-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left-right-bottom { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right-top { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; }
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }
					td.border-left-top { border-left: .5pt solid windowtext; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-right-top { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					span.bold { font-size: 12.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.value { font-size: 12.0pt; font-family: Arial; color: windowtext; }
					div.page { width: 210mm; height: 297mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 12pt; }
					.graphLittle { font-family: Arial; font-size: 7pt; }
					.graphMain { font-family: Arial; font-size: 12pt;font-weight: bold;  }
					.graph-number { font-size: 9pt; font-weight: bold; }
					</style>
         </head>
         <body>
            <div class="page">
               <!--h3>Опись документов ОЭЗ </h3-->
               <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                  <tbody>
                     <tr align="center">
                        <td class="graphMain" style="width:180mm;">
								ОПИСЬ ДОКУМЕНТОВ<br/>
                           <br/>
						предоставляемых 
									<u>
                              <xsl:apply-templates select="oezin:InventoryInstancePerson/cat_ru:PersonSurname"/> 
										<xsl:apply-templates select="oezin:InventoryInstancePerson/cat_ru:PersonName"/> 
										<xsl:apply-templates select="oezin:InventoryInstancePerson/cat_ru:PersonMiddleName"/> </u>
                           <br/>
                           <span class="graphLittle">(ФИО лица, подающего опись)</span>
                           <br/>
                           <xsl:if test="oezin:InventoryInstancePerson/oezin:IdentityCard">
                              <u>
                                 <xsl:apply-templates select="oezin:InventoryInstancePerson/oezin:IdentityCard/RUScat_ru:IdentityCardCode"/> 
											<xsl:apply-templates select="oezin:InventoryInstancePerson/oezin:IdentityCard/RUScat_ru:IdentityCardName"/> 
											<xsl:apply-templates select="oezin:InventoryInstancePerson/oezin:IdentityCard/RUScat_ru:IdentityCardSeries"/> 
											<xsl:apply-templates select="oezin:InventoryInstancePerson/oezin:IdentityCard/RUScat_ru:IdentityCardNumber"/> 
											<!--xsl:apply-templates select="oezin:InventoryInstancePerson/oezin:IdentityCard/cat_ru:RBIdentificationNumber"/--> 
											<xsl:apply-templates select="oezin:InventoryInstancePerson/oezin:IdentityCard/RUScat_ru:IdentityCardDate" mode="russian_date"/>
											<xsl:apply-templates select="oezin:InventoryInstancePerson/oezin:IdentityCard/cat_ru:OrganizationName"/> </u>
                              <br/>
                              <span class="graphLittle">(документ, удостоверяющий личность)</span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="oezin:InventoryInstancePerson/oezin:AuthoritesDocument">
                              <u>
                                <xsl:apply-templates select="oezin:InventoryInstancePerson/oezin:AuthoritesDocument/cat_ru:PrDocumentName"/>
                                <xsl:text> </xsl:text>
								<xsl:apply-templates select="oezin:InventoryInstancePerson/oezin:AuthoritesDocument/cat_ru:PrDocumentNumber"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="oezin:InventoryInstancePerson/oezin:AuthoritesDocument/cat_ru:PrDocumentDate" mode="russian_date"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="oezin:InventoryInstancePerson/oezin:AuthoritesDocument/cat_ru:ComplationAuthorityDate" mode="russian_date"/> 
							  </u>
                              <br/>
                              <span class="graphLittle">(документ удостоверяющий полномочия лица)</span>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <br/>
                           <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" style="width:10mm;border:solid 0.8pt #000000;">№ п/п</td>
                                    <!--td style="width:50mm;border:solid 0.8pt #000000;" class="graph">Вид, номер и дата составления документа</td-->
                                    <td align="center" class="graph" style="width:25mm;border:solid 0.8pt #000000;">Код вида документа</td>
                                    <td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">Наименование документа</td>
                                    <!--td style="width:10mm;border:solid 0.8pt #000000;" class="graph">Оригинал / копия</td-->
                                    <td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">Количество экземпляров</td>
                                    <td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">Количество листов </td>
                                    <td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">Способ предоставления документа </td>
                                    <td align="center" class="graph" style="width:55mm;border:solid 0.8pt #000000;">Примечание </td>
                                 </tr>
                                 <!--tr>
												<td style="width:10mm;border:solid 0.8pt #000000;" class="graph" align="center">1</td>
												<td colspan="3" style="width:85mm;border:solid 0.8pt #000000;" class="graph" align="center">2</td>
												<td style="width:20mm;border:solid 0.8pt #000000;" class="graph" align="center">3</td>
												<td style="width:65mm;border:solid 0.8pt #000000;" class="graph" align="center">4</td>
											</tr-->
                                 <!--tr>
												<td colspan="6" style="width:180mm;border:solid 0.8pt #000000;" class="graph">1. Документы, необходимые для принятия ДТ</td>
											</tr-->
                                 <xsl:for-each select="oezin:InventDocument">
                                    <xsl:variable name="pos" select="position()"/>
                                    <!--xsl:if test="ivt:SectionNumber=0"-->
                                    <tr>
                                       <td align="center" class="graph" style="width:10mm;border:solid 0.8pt #000000;">
                                          <xsl:number value="position()"/>
                                       </td>
                                       <td align="center" class="graph" style="width:25mm;border:solid 0.8pt #000000;">
                                          <xsl:apply-templates select="oezin:InvDocCode"/>
                                       </td>
                                       <td class="graph" style="width:30mm;border:solid 0.8pt #000000;">
                                          <xsl:apply-templates select="oezin:InvDocName"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:apply-templates select="oezin:InvDocNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:apply-templates select="oezin:InvDocDate" mode="russian_date"/>
                                       </td>
                                       <td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">
                                          <xsl:apply-templates select="oezin:InvDocCopies"/>
                                       </td>
                                       <td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">
                                          <xsl:apply-templates select="oezin:InvDocLists"/>
                                       </td>
                                       <td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">
											<xsl:variable name="xpath_PaperDocumentSign">
												<xsl:call-template name="get_xpath">
													<xsl:with-param name="node" select="oezin:PaperDocumentSign"/>
												</xsl:call-template>
											</xsl:variable>
											<element xml_node="{$xpath_PaperDocumentSign}">
												  <xsl:choose>
													 <xsl:when test="(oezin:PaperDocumentSign='true') or (oezin:PaperDocumentSign='t') or (oezin:PaperDocumentSign='1')">в виде бумажного документа</xsl:when>
													 <xsl:otherwise>в электронной форме</xsl:otherwise>
												  </xsl:choose>
											</element>
                                       </td>
                                       <td class="graph" style="width:55mm;border:solid 0.8pt #000000;">
                                          <xsl:if test="oezin:Note">
                                             <xsl:apply-templates select="oezin:Note"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:if>
                                       </td>
                                    </tr>
                                    <!--/xsl:if-->
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <br/>
							<xsl:text>Ф.И.О </xsl:text>
							<u>
                              <xsl:apply-templates select="oezin:InventoryInstancePerson/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:apply-templates select="oezin:InventoryInstancePerson/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:apply-templates select="oezin:InventoryInstancePerson/cat_ru:PersonMiddleName"/>
                              <xsl:if test="oezin:InventoryInstancePerson/cat_ru:PersonPost">
								  <xsl:text>, </xsl:text>
								  <xsl:apply-templates select="oezin:InventoryInstancePerson/cat_ru:PersonPost"/>
                              </xsl:if>
                           </u>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <br>
                           <td class="graph" style="width:180mm;">
								Дата
									<u>
                                 <xsl:apply-templates select="oezin:InventoryInstanceDate" mode="russian_date"/>
                              </u>
                           </td>
                        </br>
                     </tr>
                     <tr>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
								Подпись<text>__________________</text>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
