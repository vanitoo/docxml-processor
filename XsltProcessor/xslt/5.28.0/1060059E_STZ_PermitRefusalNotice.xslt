<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:stz_prn="urn:customs.ru:Information:ExchangeDocuments:STZ_PermitRefusalNotice:5.27.0">
	
	<xsl:param name="STZ_NotifReg"/>
	
	<xsl:template match="stz_prn:STZ_PermitRefusalNotice">
		<xsl:param name="w" select="297"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                  
                  .graphLittle {
							font-family: Arial;
							font-size: 7pt;
							}
                  
                   .inlinetable
					{border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display: -moz-inline-stack;/*Firefox 2*/
					display: inline-table; /*Хорошие браузеры*/
					_overflow: hidden;/*IE6, IE7*/
					*zoom: 1;/*включаем hasLayout для IE6, IE7*/
					*display: inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;}
					
					.value
					{border-bottom: solid 1px black;
					font-style: italic;
					vertical-align:bottom;}
					
					.descr
					{font-size: 7pt;
					text-align: center;
					vertical-align:top;}
					
					.paragraph{
						text-indent: 5mm;
						text-align: justify;
					}
                </style>
			</head>
			<body>
				<xsl:if test="stz_prn:OrderKind = 1">
					<div class="page" style="width: {$w}mm;">
						<table border="0" style="width:297mm;">
							<tbody>
								<tr>
									<td align="left" style="width:167mm" valign="bottom">
										<span style="display:inline-block; width: 100%;">
											Регистрационный № <xsl:call-template name="NotifNumber"/>
										</span>
									</td>
									<td>
										<table style="width:130mm">
											<tbody>
												<tr>
													<td align="left">
														<span class="incline">От </span>
													</td>
												</tr>
												<tr>
													<td class="graphLittle" align="center" style="border-top:1pt solid black">
														<xsl:text>
															(наименование организации, содержащее указание на ее организацинно-правовую форму (сокращенное наименование, 
															если такое скоращенное предусмотрено учредительными документами юридического лица), основной государственный 
															регистрацинный номер (далее - ОГРН), идентификационный номер налогоплательщика (далее - ИНН), 
															код причины постановки на учет в налоговом органе (далее - КПП), адрес в пределеах места нахождения - 
															для юридического лица; фамилия, имя, отчество (при наличии), адрес регистрации физического лица по месту жительства, 
															ИНН, основоной государаственный регистрационный номер индивидуального предпринимателя (далее - ОГРНИП) 
															и сведения о документе, удостоверяющем личность - для индивидуального предпринимателя)</xsl:text>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr align="center">
									<th>
										<xsl:text>Уведомление</xsl:text><br/>
										<xsl:text>об отказе в выдаче разрешения на совершение операций, предусмотренных подпунктами 1, 2 и 5 пункта 4 статьи 205</xsl:text><br/>
										<xsl:text>Таможенного кодекса Евразийского экономического союза</xsl:text>
									</th>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										<table style="table-layout: fixed; with: 100%;">
											<tbody>
												<tr valign="top" align="left">
													<td>Настоящее уведомление выдано</td>
													<td style="width: 210mm;">
														<table class="inlinetable" style="width: 100%;">
															<tbody>
																<tr align="center">
																	<td class="value" width="100%;">
																		<xsl:apply-templates select="stz_prn:Resident" mode="org"/>
																	</td>
																</tr>
																<tr align="center">
																	<td class="descr" width="100%">
																		(наименование организаци, содержащее указание на ее организационно-правовую форму (сокращенное наименование, 
																		если такое сокращенное наименование предусмотрено учредительными документами юридического лица), ОГРН, ИНН, КПП, 
																		адрес в пределах места нахождения - для юридического лица; фамилия имя, отчество (при наличии), адрес регистрации 
																		физического лица по месту жительства, ИНН, ОГРНИП и сведения о документе, удостоверяющем личность)
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										и свидетельствует о невозможности вывоза с земельного участка, предоставленного резиденту свободного порта Владивосток, территории участка 
										резидента Арктической зоны Российской Федерации, земельного участка, предоставленного резиденту территории опережающего развития, на которых 
										применяется таможенная процедура свободной таможенной зоны, на остальную часть таможенной территории Евразийского экономического союза по заявлению № 
										<xsl:apply-templates select="stz_prn:AppRegNumber" mode="reg_num_simple"/> 
										для целей совершения в отношении такого товара операций, предусмотренных 
										подпунктами 1, 2 и 5 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза, по следующим основаниям:
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_prn:Reason"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr valign="bottom">
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:apply-templates select="stz_prn:CustomsPerson/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_prn:CustomsPerson/*[contains(local-name(), 'ame')]">
											<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top" class="descr">
									<td>(начальник таможенного органа)</td>
									<td></td>
									<td>(подпись)</td>
									<td></td>
									<td>(фамилия, имя, отчество (при наличии)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="stz_prn:OrderKind = 2">
					<div class="page" style="width: {$w}mm;">
						<table border="0" style="width:297mm;">
							<tbody>
								<tr>
									<td align="left" style="width:167mm" valign="bottom">
										<span style="display:inline-block; width: 100%;">
											Регистрационный № <xsl:call-template name="NotifNumber"/>
										</span>
									</td>
									<td>
										<table style="width:130mm">
											<tbody>
												<tr>
													<td align="left">
														<span class="incline">От </span>
													</td>
												</tr>
												<tr>
													<td class="graphLittle" align="center" style="border-top:1pt solid black">
														(наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое сокращенное наименование предусмотрено 
														учредительным документов юридического лица), основной государственный регистрационный номер (далее - ОГРН), идентификационный номер налогоплательщика 
														(далее - ИНН), код причины постановки на учет в налоговом органе (КПП), адрес в пределах места нахождения, реквизиты о включении 
														в единый реестр участников свободной экономической зоны - для участника свободной экономическоой зоны на территории Республики Крым 
														и города федерального значения Севастополя (далее - реквизиты свидетельства), реквизиты разрешения таможенного органа на передачу товаров, 
														предусмотренного частью 14<sup>17</sup> статьи 18 Федерального закона от 29 ноября 2014 г. № 377-ФЗ "О развитии Республики Крым и города 
														федерального значения Севастополя и свободной экономической зоне на территории Республики Крым и города федерального значения Севастополя" (далее - 
														Федеральный закон № 377-ФЗ), если настоящее заявление подается юридическим лицом, которому в соответствии с частью 14<sup>18</sup> статьи 18 
														Федерального закона №377-ФЗ были переданы права владения, пользовани и (или) распоряжения товарами (далее - реквизиты разрешения) - 
														для юридического лица; фамилия, имя, отчество (при наличии), адрес регистрации по месту жительства, ИНН, основной государственный 
														регистрационный номер индивидуального предпринимателся (далее - ОГРНИП), сведения о документе, удостоверяющем личность, реквизиты 
														свидетельства - для индивидуального предпринимателя)
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr align="center">
									<th>
										<xsl:text>Уведомление</xsl:text><br/>
										<xsl:text>об отказе в выдаче разрешения на совершение операций, предусмотренных подпунктами 1, 2 и 5 пункта 4 статьи 205</xsl:text><br/>
										<xsl:text>Таможенного кодекса Евразийского экономического союза</xsl:text>
									</th>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										<table style="table-layout: fixed; with: 100%;">
											<tbody>
												<tr valign="top" align="left">
													<td>Настоящее уведомление выдано</td>
													<td style="width: 210mm;">
														<table class="inlinetable" style="width: 100%;">
															<tbody>
																<tr align="center">
																	<td class="value" width="100%;">
																		<xsl:apply-templates select="stz_prn:Resident" mode="org"/>
																	</td>
																</tr>
																<tr align="center">
																	<td class="descr" width="100%">
																		(наименование организаци, содержащее указание на ее организационно-правовую форму (сокращенное наименование, 
																		если такое сокращенное наименование предусмотрено учредительными документами юридического лица), ОГРН, ИНН, КПП, 
																		адрес в пределах места нахождения - для юридического лица; фамилия имя, отчество (при наличии), адрес регистрации 
																		физического лица по месту жительства, ИНН, ОГРНИП и сведения о документе, удостоверяющем личность)
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										и свидетельствует о невозможности вывоза с территории особой экономической зоны, с участка территории свободной экономической зоны на 
										территории Республики Крым и города федерального значения Севатополя, на которых применяется таможенная процедура свободной таможенной зоны, 
										на остальную часть таможенной территории Евразийского экономического союза товара по заявлению № 
										<xsl:apply-templates select="stz_prn:AppRegNumber" mode="reg_num_simple"/> 
										для целей совершения в отношении такого товара операций, предусмотренных 
										подпунктами 1, 2 и 5 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза, в связи со следующим:
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_prn:Reason"/>
									</td>
								</tr>
								<tr>
									<td class="descr">
										(указываются случаи, предусмотренные частью 14<sup>11</sup> статьи 18 Федерального закона № 377-ФЗ 
										и частью 4<sup>5</sup> статьи 37<sup>1</sup> Федерального закона от 22 июля 2005 г. № 116 
										"Об особых экономических зонах в Российской Федерации)
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr valign="bottom">
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:apply-templates select="stz_prn:CustomsPerson/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_prn:CustomsPerson/*[contains(local-name(), 'ame')]">
											<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top" class="descr">
									<td>(начальник таможенного органа)</td>
									<td></td>
									<td>(подпись)</td>
									<td></td>
									<td>(фамилия, имя, отчество (при наличии)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="stz_prn:OrderKind = 3">
					<div class="page" style="width: {$w}mm;">
						<table border="0" style="width:297mm;">
							<tbody>
								<tr>
									<td align="left" style="width:167mm" valign="bottom">
										<span style="display:inline-block; width: 100%;">
											Регистрационный № <xsl:call-template name="NotifNumber"/>
										</span>
									</td>
									<td>
										<table style="width:130mm">
											<tbody>
												<tr>
													<td align="left">
														<span class="incline">От </span>
													</td>
												</tr>
												<tr>
													<td class="graphLittle" align="center" style="border-top:1pt solid black">
														(участник свободной экономической зоны на территориях Донецкой Народной Республики, Луганской Народной Республики, Запорожской области и Херсонской области (наименование 
														организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое сокращенное наименование предусмотрено учредительным документом юридического 
														лица), основной государственный регистрационный номер (ОГРН), идентификационный номер налогоплательщика (ИНН) и код причины постановки на учет в налоговом органе (КПП), присвоенные 
														юридическому лицу в соответствии в законодательством Российской Федерации, адрес в пределах места нахождения юридического лица - для юридического лица; фамилия, имя, отчество (при наличии), 
														место жительства или место пребывания физического лица, идентификационный номер налогоплательщика (ИНН), основной государственный регистрационный номер индивидуального предпринимателя 
														(ОГРНИП) и сведения о документе, удостоверяющем личность физического лица - для физического лица (индивидуального предпринимателя)
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr align="center">
									<th>
										<xsl:text>Уведомление</xsl:text><br/>
										<xsl:text>об отказе в выдаче разрешения на совершение операций, предусмотренных подпунктами 1, 2 и 5 пункта 4 статьи 205</xsl:text><br/>
										<xsl:text>Таможенного кодекса Евразийского экономического союза</xsl:text>
									</th>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										<table style="table-layout: fixed; with: 100%;">
											<tbody>
												<tr valign="top" align="left">
													<td>Настоящее уведомление выдано</td>
													<td style="width: 210mm;">
														<table class="inlinetable" style="width: 100%;">
															<tbody>
																<tr align="center">
																	<td class="value" width="100%;">
																		<xsl:apply-templates select="stz_prn:Resident" mode="org"/>
																	</td>
																</tr>
																<tr align="center">
																	<td class="descr" width="100%">
																		(участник свободной экономической зоны на территориях Донецкой Народной Республики, Луганской Народной Республики, Запорожской области и Херсонской области (наименование 
																		организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое сокращенное наименование предусмотрено учредительным документом юридического 
																		лица), основной государственный регистрационный номер (ОГРН), идентификационный номер налогоплательщика (ИНН) и код причины постановки на учет в налоговом органе (КПП), присвоенные 
																		юридическому лицу в соответствии в законодательством Российской Федерации, адрес в пределах места нахождения юридического лица - для юридического лица; фамилия, имя, отчество (при наличии), 
																		место жительства или место пребывания физического лица, идентификационный номер налогоплательщика (ИНН), основной государственный регистрационный номер индивидуального предпринимателя 
																		(ОГРНИП) и сведения о документе, удостоверяющем личность физического лица - для физического лица (индивидуального предпринимателя)
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										и свидетельствует о невозможности вывоза с территории особой экономической зоны, с участка свободной экономической зоны, 
										на которой применяется таможенная процедура свободной таможенной зоны, 
										на остальную часть таможенной территории Евразийского экономического союза товаров по заявлению № 
										<xsl:apply-templates select="stz_prn:AppRegNumber" mode="reg_num_simple"/> 
										для целей совершения в отношении такого товаров операций, предусмотренных 
										подпунктами 1, 2 и 5 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза по следующим основаниям:
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_prn:Reason"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr valign="bottom">
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:apply-templates select="stz_prn:CustomsPerson/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_prn:CustomsPerson/*[contains(local-name(), 'ame')]">
											<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top" class="descr">
									<td>(начальник таможенного органа)</td>
									<td></td>
									<td>(подпись)</td>
									<td></td>
									<td>(фамилия, имя, отчество (при наличии)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="org">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:ShortName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="." mode="address"/>
		</xsl:for-each>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:text> Документ: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="personID"/>
		</xsl:if>
		
	</xsl:template>
	
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:apply-templates select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierName']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="personID">
		<xsl:apply-templates select="*[local-name() = 'IdentityCardSeries']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardNumber']"/>
		<xsl:if test="*[local-name() = 'IdentityCardDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'IdentityCardDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="doc">
		<xsl:apply-templates select="*[local-name() = 'PrDocumentName']"/>
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressText']">
				<xsl:apply-templates select="*[local-name() = 'AddressText']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() != 'AddressText' and local-name() != 'AddressKindCode']">
					<xsl:if test="position() != 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="NotifNumber">
		<xsl:choose>
			<xsl:when test="$STZ_NotifReg">
				<xsl:apply-templates select="$STZ_NotifReg/*[local-name() = 'RegistrationNumber']" mode="reg_num"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="stz_prn:PermitRegNumber" mode="reg_num"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="reg_num">
		<table class="inlinetable" style="width: 20mm;">
			<tbody>
				<tr align="center">
					<td class="value" width="100%;">
						<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr" width="100%">
						(код таможенного органа)
					</td>
				</tr>
			</tbody>
		</table>
		<xsl:text>/</xsl:text>
		<table class="inlinetable" style="width: 20mm;">
			<tbody>
				<tr align="center">
					<td class="value" width="100%;">
						<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="russian_date_gtd"/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr" width="100%">
						(день, месяц, год)
					</td>
				</tr>
			</tbody>
		</table>
		<xsl:text>/</xsl:text>
		<table class="inlinetable" style="width: 25mm;">
			<tbody>
				<tr align="center">
					<td class="value" width="100%;">
						<xsl:apply-templates select="*[local-name() = 'Number']"/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr" width="100%">
						(порядковый номер,<br/>начинается с единицы)
					</td>
				</tr>
			</tbody>
		</table>
		<xsl:if test="*[local-name() = 'AddNumber' or local-name() = 'DocKind']">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AddNumber' or local-name() = 'DocKind']"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="reg_num_simple">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'Number' or local-name() = 'GTDNumber']"/>
		<xsl:if test="*[local-name() = 'AddNumber' or local-name() = 'DocKind']">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AddNumber' or local-name() = 'DocKind']"/>
		</xsl:if>
	</xsl:template>


	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn2"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn2,5,1)='-' and substring($dateIn2,8,1)='-'">
				<xsl:value-of select="substring($dateIn2,9,2)"/>
				<xsl:value-of select="substring($dateIn2,6,2)"/>
				<xsl:value-of select="substring($dateIn2,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn2"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='STZ_PermitRefusalNotice']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
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
	<xsl:template match="*" mode="date">
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
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn2" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
