<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="pl  catComFin_ru  cat_ru" version="1.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:pl="urn:customs.ru:Information:CommercialFinanceDocuments:PackingList:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
	<xsl:template match="//*[local-name()='PackingList']//*" priority="-1">
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
   <xsl:template match="pl:PackingList">
      <html>
         <head>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <title>Упаковочный лист</title>
            <style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 0; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 6.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap; */padding-left:4pt }
					td.bold { font-size: 8.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 9.0pt; font-family: Courier New; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
					td.border-left { border-left: medium none; border-right: .8pt solid black; }
					td.border { border-left: .8pt solid windowtext; border-right: .8pt solid windowtext; border-top: .8pt solid windowtext; border-bottom: .8pt solid windowtext; }
					td.border-left { border-left: .8pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: medium none; } 
					td.border-right { border-left: medium none; border-right: .8pt solid windowtext; border-top: medium none; border-bottom: medium none; } 
					td.border-top { border-left: medium none; border-right: medium none; border-top: .8pt solid windowtext; border-bottom: medium none; } 
					td.border-bottom { border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: .8pt solid windowtext; } 
					td.border-top-bottom { border-left: medium none; border-right: medium none; border-top: .8pt solid windowtext; border-bottom: .8pt solid windowtext; } 
					td.border-top-right { border-left: medium none; border-right: .8pt solid windowtext; border-top: .8pt solid windowtext; border-bottom: medium none; } 
					td.border-top-right-bottom { border-left: medium none; border-right: .8pt solid windowtext; border-top: .8pt solid windowtext; border-bottom: .8pt solid windowtext; }
					td.border-left-right-bottom { border-left: .8pt solid windowtext; border-right: .8pt solid windowtext; border-top: medium none; border-bottom: .8pt solid windowtext; }
					td.border-right-bottom { border-left: medium none; border-right: .8pt solid windowtext; border-top: medium none; border-bottom: .8pt solid windowtext; }
					td.border-left-bottom { border-left: .8pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .8pt solid windowtext; }
					td.border-left-right { border-left: .8pt solid windowtext; border-right: .8pt solid windowtext; border-top: medium none; border-bottom: medium none; }
					span.bold { font-size: 12.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.value { font-size: 12.0pt; font-family: Courier New; color: windowtext; }
					div.page { width: 210mm; /*height: 297mm;*/ margin-top: 6pt; margin-bottom: 6pt; padding:	5mm; padding-left: 5mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 7pt; }
					.graph-number { font-size: 9pt; font-weight: bold; }
				</style>
         </head>
         <body>
            <div class="page">
               <span class="bold">Упаковочный лист 
				   <xsl:if test="pl:DeliveryTerms/pl:Registration/cat_ru:PrDocumentNumber">
					   <xsl:text> № </xsl:text>
					   <xsl:apply-templates select="pl:DeliveryTerms/pl:Registration/cat_ru:PrDocumentNumber"/>
				   </xsl:if>
				   <xsl:if test="pl:DeliveryTerms/pl:Registration/cat_ru:PrDocumentDate">
					   <xsl:text> от </xsl:text>
					   <xsl:apply-templates select="pl:DeliveryTerms/pl:Registration/cat_ru:PrDocumentDate" mode="russian_date"/>
				   </xsl:if>
               </span>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tr>
                     <td class="border" colspan="3" height="83" rowspan="2" width="310">
								Грузоотправитель / Экспортер<br/>
                        <br/>
                        <span class="value">
                           <xsl:apply-templates select="pl:Consignor"/>
                        </span>
                     </td>
                     <td class="border" colspan="4" height="55" width="315">
						 <xsl:if test="pl:DeliveryTerms/pl:Invoice">
							№ и дата инвойса<br/>
							<br/>
							<span class="value">
							   <xsl:apply-templates select="pl:DeliveryTerms/pl:Invoice/cat_ru:PrDocumentNumber"/>
							   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							   <xsl:apply-templates select="pl:DeliveryTerms/pl:Invoice/cat_ru:PrDocumentDate" mode="russian_date"/>
							</span>
							<br/>
                        </xsl:if>
                        <xsl:if test="pl:DeliveryTerms/pl:Contract">
							№ и дата контракта<br/>
							<br/>
							<span class="value">
							   <xsl:apply-templates select="pl:DeliveryTerms/pl:Contract/cat_ru:PrDocumentNumber"/>
							   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							   <xsl:apply-templates select="pl:DeliveryTerms/pl:Contract/cat_ru:PrDocumentDate" mode="russian_date"/>
							</span>
							<br/>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left-right" colspan="4" height="28" width="315">
								Примечание:
							</td>
                  </tr>
                  <tr>
                     <td class="border-left-right-bottom" colspan="3" height="83" width="310">
								Грузополучатель / Импортер:<br/>
                        <br/>
                        <span class="value">
                           <xsl:apply-templates select="pl:Consignee"/>
                        </span>
                     </td>
                     <td class="border-left-right-bottom" colspan="4" height="83" rowspan="1" width="315">
                        <span class="value">
                           <xsl:apply-templates select="pl:DeliveryTerms/pl:TermsDescription"/>
                           <br/>
                           <xsl:apply-templates select="pl:DeliveryTerms/pl:DeliveryPlace"/>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left-right-bottom" colspan="7">
                        <table>
                           <tbody>
                              <tr>
                                 <td class="border-right-bottom" height="50" width="28,5mm">
												Описание товара
											</td>
                                 <td class="border-left-right-bottom" height="50" width="38mm">
												Отметки и кол-во упаковок
											</td>
                                 <td class="border-left-right-bottom" height="50" width="28,5mm">
												Количество/<br/>
												единицы<br/>
												измерения
											</td>
                                 <td class="border-left-right-bottom" height="25" width="19mm">
												Вес<br/>
												брутто / кг
											</td>
                                 <td class="border-left-right-bottom" height="25" width="19mm">
												Вес<br/>
												нетто / кг
											</td>
                                 <td class="border-left-right-bottom" height="50" width="19mm">
												Кол-во товара<br/>
												в груз месте
											</td>
                                 <td class="border-left-bottom" height="50" width="19mm">
												Объем
											</td>
                                 <td class="border-left-bottom" height="50" width="38mm">
												Грузовые места
											</td>
                              </tr>
                              <xsl:for-each select="pl:Goods">
                                 <tr style="border-top: 1px dotted gray">
                                    <td width="28,5mm" style="border-top: 1px dotted gray">
                                       <span class="value">
                                          <xsl:for-each select="pl:GoodsDescription">
                                             <xsl:apply-templates select="."/>
                                          </xsl:for-each>
                                          <xsl:if test="pl:GoodMarking">
                                             <br/>Артикул:<xsl:apply-templates select="pl:GoodMarking"/>
                                          </xsl:if> Размеры:<xsl:apply-templates select="pl:Dimensions"/>
                                       </span>
                                    </td>
                                    <td width="38mm" style="border-top: 1px dotted gray">
                                       <xsl:for-each select="pl:PackingInfo">
                                          <span class="value">
                                             <xsl:apply-templates select="pl:PakingQuantity"/>
                                             <xsl:if test="pl:PackingDescription">
                                                <xsl:text> </xsl:text>
                                                <xsl:apply-templates select="pl:PackingDescription"/>
                                             </xsl:if>
                                             <xsl:if test="pl:PackingCode">
                                                <xsl:text disable-output-escaping="yes"> </xsl:text>(<xsl:apply-templates select="pl:PackingCode"/>)</xsl:if>
                                          </span>
                                       </xsl:for-each>
                                    </td>
                                    <td width="28,5mm" style="border-top: 1px dotted gray">
                                       <span class="value">
                                          <xsl:apply-templates select="pl:GoodsQuantity"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:if test="pl:MeasureUnitQualifierName">
                                             <xsl:apply-templates select="pl:MeasureUnitQualifierName"/>
                                          </xsl:if>
                                          <xsl:if test="pl:MeasureUnitQualifierCode">
                                             <xsl:apply-templates select="pl:MeasureUnitQualifierCode"/>
                                          </xsl:if>
                                          <br/>
                                       </span>
                                    </td>
                                    <td width="8mm" style="border-top: 1px dotted gray">
                                       <span class="value">
                                          <xsl:apply-templates select="pl:GrossWeightQuantity"/>
                                       </span>
                                    </td>
                                    <td width="8mm" style="border-top: 1px dotted gray">
                                       <span class="value">
                                          <xsl:apply-templates select="pl:NetWeightQuantity"/>
                                       </span>
                                    </td>
                                    <td width="19mm" style="border-top: 1px dotted gray">
                                       <span class="value">
                                          <xsl:apply-templates select="pl:PlaceGoodsQuantity"/>
                                       </span>
                                    </td>
                                    <td width="19mm" style="border-top: 1px dotted gray">
                                       <span class="value">
                                          <xsl:if test="pl:GoodsVolume">
                                             <xsl:apply-templates select="pl:GoodsVolume"/>
                                          </xsl:if>
                                          <xsl:if test="pl:VolumeUnitQualifierName">
                                             <xsl:text disable-output-escaping="yes"> </xsl:text>
                                             <xsl:apply-templates select="pl:VolumeUnitQualifierName"/>
                                          </xsl:if>
                                       </span>
                                    </td>
                                    <td width="38mm" style="border-top: 1px dotted gray">
                                       <xsl:for-each select="pl:PlacesQuantity">
                                          <span class="value">
                                             <xsl:if test="pl:PlacesQuantity">
                                                <xsl:apply-templates select="pl:PlacesQuantity"/>
                                                <xsl:text disable-output-escaping="yes"> </xsl:text>
                                             </xsl:if>
                                             <xsl:if test="pl:PlacesPartQuantity">(<xsl:text> </xsl:text>
                                                <xsl:apply-templates select="pl:PlacesPartQuantity"/>
                                                <xsl:text> -часть места)</xsl:text>
                                             </xsl:if>
                                             <xsl:if test="pl:PlacesDescription">
                                                <xsl:apply-templates select="pl:PlacesDescription"/>
                                             </xsl:if>
                                             <xsl:if test="pl:PackingCode">
                                                <xsl:text disable-output-escaping="yes"> </xsl:text>(<xsl:apply-templates select="pl:PackingCode"/>)</xsl:if>
                                          </span>
                                       </xsl:for-each>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                           </tbody>
                        </table>
                     </td>
                  </tr>
                  <!--td height="50" width="201" colspan="2" class="border-left-right-bottom">
								Описание товара
							</td>
							<td height="50" width="133" class="border-left-right-bottom">
								Отметки и кол-во упаковок
							</td>
							<td height="50" width="102" class="border-left-right-bottom">
								Количество/<br/>
								ед.<br/>
								измерения
							</td>
							<td height="50" width="70" class="border-left-right-bottom">
								Вес<br/>
								нетто / кг
							</td>
							<td height="50" width="59" class="border-left-right-bottom">
								Вес<br/>
								брутто / кг
							</td>
							<td height="50" width="78" class="border-left-right-bottom">
								Объем
							</td>
						</tr>
						<xsl:for-each select="pl:Goods">
						<tr>
							<td width="186" colspan="2" class="border-left">
								<span class="value"><xsl:apply-templates select="pl:GoodsDescription"/></span>
							</td>
							<td width="128">
								<xsl:for-each select="pl:PlacesQuantity">
									<span class="value">
										<xsl:if test="pl:PlacesQuantity">полностью занято товаром<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:apply-templates select="pl:PlacesQuantity"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
										<xsl:if test="pl:PlacesPartQuantity">частично занято товаром<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:apply-templates select="pl:PlacesPartQuantity"/></xsl:if>
										<xsl:if test="pl:PlacesDescription"><xsl:apply-templates select="pl:PlacesDescription"/></xsl:if>
										<xsl:if test="pl:PackingCode"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(<xsl:apply-templates select="pl:PackingCode"/>)</xsl:if>
										
										</span>
								</xsl:for-each>
							</td>
							
							<td width="102">
								<span class="value">	
									<xsl:apply-templates select="pl:GoodsQuantity"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:apply-templates select="pl:MeasureUnitQualifierCode"/><br/>
								</span>
							</td>
							<td width="71">
								<span class="value"><xsl:apply-templates select="pl:NetWeightQuantity"/></span>
							</td>
							<td width="57">
								<span class="value"><xsl:apply-templates select="pl:GrossWeightQuantity"/></span>
							</td>
							<td width="80" class="border-right">
								<span class="value">					
									<xsl:apply-templates select="pl:GoodsVolume"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>									
									<xsl:apply-templates select="pl:VolumeUnitQualifierName"/>
								</span>
							</td>
						</tr>
						</xsl:for-each-->
                  <tr>
                     <td class="border-left-right" colspan="7">
                        <span class="value">	Итого:
							нетто<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:apply-templates select="pl:NetWeightQuantity"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							брутто<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:apply-templates select="pl:GrossWeightQuantity"/>
                           <br/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:for-each select="pl:TotalPlacesQuantity">
                              <xsl:apply-templates select="pl:PlacesQuantity"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:apply-templates select="pl:PlacesDescription"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(<xsl:apply-templates select="pl:PackingCode"/>)
                              <xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left-bottom" colspan="3" height="76" width="309">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td class="border-right-bottom" colspan="4" height="76" style="vertical-align: bottom" width="315">
                        <span class="value">Подпись ___________________</span>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="pl:Consignor | pl:Consignee">
      <xsl:apply-templates select="cat_ru:OrganizationName"/>
      <br/>
      <xsl:apply-templates select="cat_ru:Address"/>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <xsl:apply-templates select="cat_ru:StreetHouse"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:apply-templates select="cat_ru:City"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:if test="string(cat_ru:PostalCode)!=''">
         <xsl:apply-templates select="cat_ru:PostalCode"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </xsl:if>
      <xsl:apply-templates select="cat_ru:CounryName"/>
   </xsl:template>
</xsl:stylesheet>
