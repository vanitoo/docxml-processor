<?xml version="1.0" encoding="utf-8"?>
<!--
	OrderKind = 1, DocKind = 1 - 37н, приложение 1
	OrderKind = 1, DocKind = 2 - 37н, приложение 2
	OrderKind = 2, DocKind = 1 - 42н, приложение 1
	OrderKind = 2, DocKind = 2 - 42н, приложение 3
	OrderKind = 3, DocKind = 1 - 102н, приложение 1
	OrderKind = 3, DocKind = 2 - 102н, приложение 1
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:stz_aog="urn:customs.ru:Information:ExchangeDocuments:STZ_AppOperationsGoods:5.28.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0">
	<xsl:param name="STZ_NotifReg"/>
	<xsl:template match="stz_aog:STZ_AppOperationsGoods">
		<xsl:param name="w" select="297"/>
		<html>
			<head>
				<style>
                  body {
                  font-family: Arial;
                  background: #cccccc;
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

				  .graphLittle {
							font-family: Arial;
							font-size: 7pt;
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
				<xsl:if test="stz_aog:OrderKind = 1 and stz_aog:DocKind = 1">
					<div class="page" style="width: {$w}mm;">
						<table border="0" style="width:297mm;">
							<tbody>
								<tr>
									<td align="left" style="width:167mm" valign="bottom">
										<span style="display:inline-block; width: 167mm;">
											Отметка таможенного органа
											<br/>
											Регистрационный № <xsl:call-template name="NotifNumber"/>
										</span>
									</td>
									<td>
										<table style="width:130mm">
											<tbody>
												<tr>
													<td align="left">
														<span class="incline">B </span>
														<xsl:apply-templates select="stz_aog:Customs/cat_ru:Code"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="stz_aog:Customs/cat_ru:OfficeName"/>
													</td>
												</tr>
												<tr align="center">
													<td class="graphLittle" style="border-top:1pt solid black">(наименование таможенного органа (с указанием кода таможенного органа)</td>
												</tr>
												<tr>
													<td align="left">
														<span class="incline">От </span>
														<xsl:apply-templates select="stz_aog:Resident/cat_ru:OrganizationName"/> 
														<xsl:if test="stz_aog:Resident/RUScat_ru:SubjectAddressDetails">
															<xsl:for-each select="stz_aog:Resident/RUScat_ru:SubjectAddressDetails">
																<xsl:text>, </xsl:text>
																<xsl:apply-templates select="." mode="address"/>
															</xsl:for-each> 
														</xsl:if>
														<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures">
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
														</xsl:if>
														<!--xsl:if test="stz_aog:Resident/stz_aog:CertificateNumber">
															свидетельство о включении в реестр № 
															<xsl:apply-templates select="stz_aog:Resident/stz_aog:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
															<xsl:apply-templates select="stz_aog:Resident/stz_aog:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
														</xsl:if-->
													</td>
												</tr>
												<tr>
													<td class="graphLittle" align="center" style="border-top:1pt solid black">
														<xsl:text>наименование организации, содержащее указание на ее организацинно-правовую форму (сокращенное наименование, если такое скоращенное предусмотрено учредительными документами юридического лица), основной государственный регистрацинный номер (далее - ОГРН), идентификационный номер налогоплательщика (далее - ИНН), код причины постановки на учет в налоговом органе (далее - КПП), адрес в пределеах места нахождения - для юридического лица; фамилия, имя, отчество (при наличии), адрес регистрации физического лица по месту жительства, ИНН, основоной государаственный регистрационный номер индивидуального предпринимателя (далее - ОГРНИП) и сведения о документе, удостоверяющем личность - для индивидуального предпринимателя)</xsl:text>
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
										<xsl:text>Заявление</xsl:text><br/>
										<xsl:text>на совершение операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205</xsl:text><br/>
										<xsl:text>Таможенного кодекса Евразийского экономического союза</xsl:text>
									</th>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										Прошу разрешить вывоз товара, помещенного под таможенную процедуру свободной таможенной зоны, и (или) 
										товара, изготовленного (полученного) из товаров, помещенных под таможенную процедуру свободной таможенной зоны 
										(далее - вывозимый товар), с земельного участка, представленного резиденту свободного порта Владивосток, территории участка 
										резидента Арктической зоны Российской Федерации, земельного участка, предоставленного резиденту территории опережающего развития 
										(далее - Участок) 
										<xsl:apply-templates select="stz_aog:NameOfTerritory"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="stz_aog:AddressOfTerritory" mode="address"/>
										, 
										для целей совершения операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза 
										(далее соответственно - Операции по ремонту и техническим испытаниям, ТК ЕАЭС), согласно представленным ниже сведениям
										<xsl:if test="stz_aog:SheetsNumber">
											<xsl:text> на </xsl:text>
											<xsl:apply-templates select="stz_aog:SheetsNumber"/>
											<xsl:text> л.</xsl:text>
										</xsl:if>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="paragraph">
										1. Наименование товара и его характеристики
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair//*[local-name() = 'EquipmentGoods' or local-name() = 'TestingGoodsInfo']">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_aog:GoodsDescription"/>
											<xsl:if test="stz_aog:GoodsTNVEDCode">
												<xsl:text>, Код ТН ВЭД </xsl:text>
												<xsl:apply-templates select="stz_aog:GoodsTNVEDCode"/>
											</xsl:if>
											<xsl:if test="stz_aog:GoodsQuantity">
												<xsl:text>, Кол-во: </xsl:text>
												<xsl:for-each select="stz_aog:GoodsQuantity">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="stz_aog:GoodsGroupInformation">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:for-each select="stz_aog:GoodsGroupInformation">
												<xsl:if test="position() != 1">; </xsl:if>
												<xsl:for-each select="*[local-name() = 'Manufacturer' or local-name() = 'Trademark' or local-name() = 'GoodMarking' or local-name() = 'GoodsMark' or local-name() = 'GoodsModel' or local-name() = 'GoodsStandard' or local-name() = 'GoodsSort']">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:for-each>
											<xsl:text> </xsl:text>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										2. Номер декларации (номера дерлараций) на товары, в соответствии с которой товар(часть, узел, агрегат товара)  был помещен 
										под таможенную процедуру свободной таможенной зоны, и номер товара в декларации (декларациях) на товары (сведения указываются, 
										если вывозится товар (часть, узел, агрегат товара), ранее помещенный под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair//*[local-name() = 'EquipmentGoods' or local-name() = 'TestingGoodsInfo']">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:for-each select="stz_aog:GoodsDecl">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="stz_aog:DeclRegNum" mode="reg_num_simple"/>
												<xsl:apply-templates select="stz_aog:CustomsDoc" mode="doc"/>
												<xsl:text> Товар №: </xsl:text>
												<xsl:for-each select="stz_aog:GoodsDeclnfo">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="stz_aog:GoodsNumber"/>
													<xsl:if test="stz_aog:GoodsQuantity">
														<xsl:text>, Кол-во: </xsl:text>
														<xsl:for-each select="stz_aog:GoodsQuantity">
															<xsl:if test="position() != 1">, </xsl:if>
															<xsl:apply-templates select="." mode="quantity"/>
														</xsl:for-each>
													</xsl:if>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										3. Реквизиты документа бухгалтерского учета (наименование, дата, номер), согласно которому вывозимый товар отражен в бухгалтерском учете организации, 
										являющейся резидентом территории опережающего развития, свободного порта Владивосток, Арктической зоны Российской Федерации (сведения указываются, 
										если вывозится товар, изготовленный (полученный) из товара, помещенного под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair//*[local-name() = 'EquipmentGoods' or local-name() = 'TestingGoodsInfo']/stz_aog:GoodsAccountDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										4. Цель вывоза и место (места) совершения Операций по ремонту и техническим испытаниям с указанием адреса места нахождения производственных 
										или иных мощностей, на территории которых такие операции будут совершаться
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForRepair/stz_aog:RepairAndTestingOperations"/>
										<br/>
										<xsl:for-each select="stz_aog:GoodsForRepair/stz_aog:RepairAndTestingAddress">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="address"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										5. Лицо (лица), которое непосредственно будет совершать Операции по ремонту и техническим испытаниям за пределами 
										земельного участка, предоставленного резиденту свободного порта Владивосток, территории участка резидента Арктической зоны 
										Российской Федерации, земельного участка, представленного резиденту территории опережающего развития
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair/stz_aog:RepairAndTestingPerson">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:OrganizationName"/> 
											<xsl:if test="RUScat_ru:SubjectAddressDetails">
												<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="." mode="address"/>
												</xsl:for-each> 
											</xsl:if>
											<xsl:if test="cat_ru:RFOrganizationFeatures">
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"> ОГРН <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN"> ИНН <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP"> КПП <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="personID"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="descr">
										(наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое сокращенное наименование 
										предусмотрено учредительными документами юридического лица), ОГРН, ИНН, КПП, адрес в пределах места нахождения - для юридического лица; 
										фамилия, имя, отчество (при наличии), адрес регистрации физического лица по месту жительства, ИНН, ОГРНИП и сведения о документе, удостверяющем личность - 
										для индивидуального предпринимателя)
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										6. Реквизиты документов, подтверждающих передачу вывозимого товара лицу, которое будет непосредственно совершать Операции 
										по ремонту и техническим испытаниям в отношении вывозимого товара
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair/stz_aog:ConfirmTransferDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										7. Срок обратного ввоза товара с учетом целей и обстоятельств вывоза такого товара
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForRepair/stz_aog:EntryGoodsTerm" mode="russian_date"/>
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
										<xsl:apply-templates select="stz_aog:ResidentSignature/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_aog:ResidentSignature/*[contains(local-name(), 'ame')]">
											<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top" class="descr">
									<td>(резидент территории опережающего развития, свободного порта Владивосток, Арктической зоны Российской Федерации</td>
									<td></td>
									<td>(подпись)</td>
									<td></td>
									<td>(фамилия, имя, отчество (при наличии)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="stz_aog:OrderKind = 1 and stz_aog:DocKind = 2">
					<div class="page" style="width: {$w}mm;">
						<table border="0" style="width:297mm;">
							<tbody>
								<tr>
									<td align="left" style="width:167mm" valign="bottom">
										<span style="display:inline-block; width: 167mm;">
											Отметка таможенного органа
											<br/>
											Регистрационный № <xsl:call-template name="NotifNumber"/>
										</span>
									</td>
									<td>
										<table style="width:130mm">
											<tbody>
												<tr>
													<td align="left">
														<span class="incline">B </span>
														<xsl:apply-templates select="stz_aog:Customs/cat_ru:Code"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="stz_aog:Customs/cat_ru:OfficeName"/>
													</td>
												</tr>
												<tr align="center">
													<td class="graphLittle" style="border-top:1pt solid black">(наименование таможенного органа (с указанием кода таможенного органа)</td>
												</tr>
												<tr>
													<td align="left">
														<span class="incline">От </span>
														<xsl:apply-templates select="stz_aog:Resident/cat_ru:OrganizationName"/> 
														<xsl:if test="stz_aog:Resident/RUScat_ru:SubjectAddressDetails">
															<xsl:for-each select="stz_aog:Resident/RUScat_ru:SubjectAddressDetails">
																<xsl:text>, </xsl:text>
																<xsl:apply-templates select="." mode="address"/>
															</xsl:for-each> 
														</xsl:if>
														<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures">
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
														</xsl:if>
														<!--xsl:if test="stz_aog:Resident/stz_aog:CertificateNumber">
															свидетельство о включении в реестр № 
															<xsl:apply-templates select="stz_aog:Resident/stz_aog:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
															<xsl:apply-templates select="stz_aog:Resident/stz_aog:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
														</xsl:if-->
													</td>
												</tr>
												<tr>
													<td class="graphLittle" align="center" style="border-top:1pt solid black">
														<xsl:text>(наименование организации, содержащее указание на ее организацинно-правовую форму (сокращенное наименование, если такое скоращенное предусмотрено учредительными документами юридического лица), основной государственный регистрацинный номер (далее - ОГРН), идентификационный номер налогоплательщика (далее - ИНН), код причины постановки на учет в налоговом органе (далее - КПП), адрес в пределеах места нахождения - для юридического лица; фамилия, имя, отчество (при наличии), адрес регистрации физического лица по месту жительства, ИНН, основоной государаственный регистрационный номер индивидуального предпринимателя (далее - ОГРНИП) и сведения о документе, удостоверяющем личность - для индивидуального предпринимателя)</xsl:text>
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
										<xsl:text>Заявление</xsl:text><br/>
										<xsl:text>на совершение операций, предусмотренных подпунктом 5 пункта 4 статьи 205</xsl:text><br/>
										<xsl:text>Таможенного кодекса Евразийского экономического союза</xsl:text>
									</th>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										Прошу разрешить вывоз товара, помещенного под таможенную процедуру свободной таможенной зоны, и (или) 
										товара, изготовленного (полученного) из товаров, помещенных под таможенную процедуру свободной таможенной зоны 
										(далее - вывозимый товар), с земельного участка, представленного резиденту свободного порта Владивосток, территории участка 
										резидента Арктической зоны Российской Федерации, земельного участка, предоставленного резиденту территории опережающего развития 
										<xsl:apply-templates select="stz_aog:NameOfTerritory"/>
										, 
										для целей совершения операций, предусмотренных подпунктом 5 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза 
										(далее - Операции по переработке), согласно представленным ниже сведениям
										<xsl:if test="stz_aog:SheetsNumber">
											<xsl:text> на </xsl:text>
											<xsl:apply-templates select="stz_aog:SheetsNumber"/>
											<xsl:text> л.</xsl:text>
										</xsl:if>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="paragraph">
										1. Вывозимый товар с указанием наименования, классификационного кода в соответствии с единой Товарной номенклатурой внешнеэкономической 
										деятельности Евразийского экономического союза (далее - ТН ВЭД ЕАЭС), количество в основных или дополнительных единицах измерения
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:PlacedGoods">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_aog:GoodsDescription"/>
											<xsl:if test="stz_aog:GoodsTNVEDCode">
												<xsl:text>, Код ТН ВЭД </xsl:text>
												<xsl:apply-templates select="stz_aog:GoodsTNVEDCode"/>
											</xsl:if>
											<xsl:text> Количество: </xsl:text>
											<xsl:for-each select="stz_aog:GoodsQuantity">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										2. Товар, который будет получен из вывозимого товара после совершения Операций по переработке (далее - получаемый товар), 
										с указанием наименования, классификационного кода в соответствии с ТН ВЭД ЕАЭС, количество в основных или дополнительных единицах измерения 
										в соответствии с ТН ВЭД ЕАЭС
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:GoodsResult">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_aog:GoodsDescription"/>
											<xsl:if test="stz_aog:GoodsTNVEDCode">
												<xsl:text>, Код ТН ВЭД </xsl:text>
												<xsl:apply-templates select="stz_aog:GoodsTNVEDCode"/>
											</xsl:if>
											<xsl:text> Количество: </xsl:text>
											<xsl:for-each select="stz_aog:GoodsQuantity">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										3. Товар Евразийского экономического союза, используемый для изготовления получаемых товаров, который будет использован при совершении Операций по переработке, 
										с указанием наименования, количество в основных или дополнительных единицах измерения в соответствии с ТН ВЭД ЕАЭС
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:GoodsResult">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_aog:GoodsDescription"/>
											<xsl:text> Количество: </xsl:text>
											<xsl:for-each select="stz_aog:GoodsQuantity">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										4. Номер декларации (номера дерлараций) на товары, в соответствии с которой (которыми) вывозимый товар  был помещен 
										под таможенную процедуру свободной таможенной зоны, и номер товара в декларации (декларациях) на товары
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:PlacedGoods/stz_aog:GoodsDeclaration">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:DeclRegNum" mode="reg_num_simple"/>
											<xsl:apply-templates select="stz_aog:CustomsDoc" mode="doc"/>
											<xsl:text> Товар №: </xsl:text>
											<xsl:for-each select="stz_aog:GoodsDeclnfo/stz_aog:GoodsNumber">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										5. Реквизиты документа бухгалтерского учета (наименование, дата, номер), согласно которому вывозимый товар отражен в бухгалтерском учете организации, 
										являющейся резидентом территории опережающего развития, свободного порта Владивосток, Арктической зоны Российской Федерации (сведения указываются, 
										если вывозится товар, изготовленный (полученный) из товара, помещенного под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/*[local-name() = 'PlacedGoods' or local-name() = 'GoodsResult' or local-name() = 'EECGoods']/*[contains(local-name(),'AccountDoc')]">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										6. Операции по переработке, которые являются составной частью производственного процесса и  будут совершаться за пределами земельного участка, 
										предоставленного резиденту свободного порта Владивосток, территории участка резидента Арктической зоны Российской Федерации, земельного участка, 
										предоставленного резиденту территории опережающего развития, а также технологии их совершения
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:ProcessingOperations">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										7. Причины, препятствующие совершению на земельном участке, предоставленном резиденту свободного порта Владивосток, на территории участка 
										резидента Арктической зоны Российской Федерации, земельном участке, предоставленном резиденту территории опережающего развития, 
										Операций по переработке, которые будут совершаться за пределами земельного участка, предоставленного резиденту свободного порта Владивосток, 
										территории участка резидента Арктической зоны Российской Федерации, земельного участка, предоставленного резиденту территории 
										опережающего развития
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForProcessing/stz_aog:Reason"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										8. Лицо (лица), непосредственно совершающее Операции по переработке за пределами земельного участка, предоставленного резиденту свободного порта Владивосток, 
										территории участка реидента Арктической зоны Российской Федерации, земельного участка, предоставленного резиденту территории опережающего развития
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:ProcessingPerson">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:OrganizationName"/> 
											<xsl:if test="RUScat_ru:SubjectAddressDetails">
												<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="." mode="address"/>
												</xsl:for-each> 
											</xsl:if>
											<xsl:if test="cat_ru:RFOrganizationFeatures">
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"> ОГРН <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN"> ИНН <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP"> КПП <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="personID"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="descr">
										(наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое сокращенное наименование 
										предусмотрено учредительными документами юридического лица), ОГРН, ИНН, КПП, адрес в пределах места нахождения - для юридического лица; 
										фамилия, имя, отчество (при наличии), адрес регистрации физического лица по месту жительства, ИНН, ОГРНИП и сведения о документе, удостверяющем личность - 
										для индивидуального предпринимателя)
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										9. Место (места) (с указанием адреса) совершения Операций по переработке/место нахождения производственных мощностей, 
										с использованием которых будут совершаться Операции по переработке/адрес места нахождения производственных мощностей,
										с использованием которых будут совершаться Операции по переработке
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:ProcessingPlace">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="address"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										10. Реквизиты документов, на основарии которых осуществляется передача вывозимого товара (рекрвизиты документа (документов), 
										подтверждающего передачу вывозимого товара) лицу, которое будет непосредственно совершать Операции по переработке в отношении вывозимого товара
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:ConfirmTransferDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										11. Сроки совершения Операций по переработке с учетом продолжительности производственного процесса и времени перевозки товаров от 
										земельного участка, предоставленного резиденту свободного порта Владивосток, участка резидента Арктической зоны Российской Федерации, 
										земельного участка, предоставленного резиденту терртоирии опережающего развития, до места (мест) совершения таких операций и обратно
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForProcessing/stz_aog:ProcessingTerm" mode="russian_date"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										12. Предлагаемые способы идентификации вывозимого товара в получаемом товаре при его последующем ввозе на земельный участок, 
										предоставленный резиденту свободного порта Владивосток, территорию участка резидента Арктической зоны Российской Федерации, земельный участок, 
										предоставленный резиденту территории опережающего развития
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForProcessing/stz_aog:MethodIdentify"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										13. Нормы расхода вывозимого товара на единицу получаемого товара или нормы выхода получаемого товара
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForProcessing/stz_aog:YieldNorm"/>
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
										<xsl:apply-templates select="stz_aog:ResidentSignature/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_aog:ResidentSignature/*[contains(local-name(), 'ame')]">
											<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top" class="descr">
									<td>(резидент территории опережающего развития, свободного порта Владивосток, Арктической зоны Российской Федерации</td>
									<td></td>
									<td>(подпись)</td>
									<td></td>
									<td>(фамилия, имя, отчество (при наличии)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="stz_aog:OrderKind = 2 and stz_aog:DocKind = 1">
					<div class="page" style="width: {$w}mm;">
						<table border="0" style="width:297mm;">
							<tbody>
								<tr>
									<td align="left" style="width:167mm" valign="bottom">
										<span style="display:inline-block; width: 167mm;">
											Отметка таможенного органа
											<br/>
											Регистрационный № <xsl:call-template name="NotifNumber"/>
										</span>
									</td>
									<td>
										<table style="width:130mm">
											<tbody>
												<tr>
													<td align="left">
														<span class="incline">B </span>
														<xsl:apply-templates select="stz_aog:Customs/cat_ru:Code"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="stz_aog:Customs/cat_ru:OfficeName"/>
													</td>
												</tr>
												<tr align="center">
													<td class="graphLittle" style="border-top:1pt solid black">(наименование таможенного органа (с указанием кода таможенного органа)</td>
												</tr>
												<tr>
													<td align="left">
														<span class="incline">От </span>
														<xsl:apply-templates select="stz_aog:Resident/cat_ru:OrganizationName"/> 
														<xsl:if test="stz_aog:Resident/RUScat_ru:SubjectAddressDetails">
															<xsl:for-each select="stz_aog:Resident/RUScat_ru:SubjectAddressDetails">
																<xsl:text>, </xsl:text>
																<xsl:apply-templates select="." mode="address"/>
															</xsl:for-each> 
														</xsl:if>
														<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures">
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
														</xsl:if>
														<!--xsl:if test="stz_aog:Resident/stz_aog:CertificateNumber">
															свидетельство о включении в реестр № 
															<xsl:apply-templates select="stz_aog:Resident/stz_aog:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
															<xsl:apply-templates select="stz_aog:Resident/stz_aog:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
														</xsl:if-->
													</td>
												</tr>
												<tr>
													<td class="graphLittle" align="center" style="border-top:1pt solid black">
														наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое сокращенное наименование предусмотрено 
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
										<xsl:text>Заявление</xsl:text><br/>
										<xsl:text>на совершение операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205</xsl:text><br/>
										<xsl:text>Таможенного кодекса Евразийского экономического союза</xsl:text>
									</th>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										Прошу разрешить вывоз товара, помещенного под таможенную процедуру свободной таможенной зоны, и (или) 
										товара, изготовленного (полученного) из товаров, помещенных под таможенную процедуру свободной таможенной зоны 
										(далее - вывозимый товар), с территории особой экономической зоны, с участка территории свободной экономической зоны на территориях 
										Республики Крым и города федерального значения Севастополя (далее - Участок) 
										<xsl:apply-templates select="stz_aog:NameOfTerritory"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="stz_aog:AddressOfTerritory" mode="address"/>
										, 
										для целей совершения операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза 
										(далее соответственно - Операции по ремонту и техническим испытаниям, ТК ЕАЭС), согласно представленным ниже сведениям
										<xsl:if test="stz_aog:SheetsNumber">
											<xsl:text> на </xsl:text>
											<xsl:apply-templates select="stz_aog:SheetsNumber"/>
											<xsl:text> л.</xsl:text>
										</xsl:if>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="paragraph">
										1. Наименование товара и его характеристики
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair//*[local-name() = 'EquipmentGoods' or local-name() = 'TestingGoodsInfo']">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_aog:GoodsDescription"/>
											<xsl:if test="stz_aog:GoodsTNVEDCode">
												<xsl:text>, Код ТН ВЭД </xsl:text>
												<xsl:apply-templates select="stz_aog:GoodsTNVEDCode"/>
											</xsl:if>
											<xsl:if test="stz_aog:GoodsQuantity">
												<xsl:text>, Кол-во: </xsl:text>
												<xsl:for-each select="stz_aog:GoodsQuantity">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="stz_aog:GoodsGroupInformation">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:for-each select="stz_aog:GoodsGroupInformation">
												<xsl:if test="position() != 1">; </xsl:if>
												<xsl:for-each select="*[local-name() = 'Manufacturer' or local-name() = 'Trademark' or local-name() = 'GoodMarking' or local-name() = 'GoodsMark' or local-name() = 'GoodsModel' or local-name() = 'GoodsStandard' or local-name() = 'GoodsSort']">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										2. Номер декларации (номера дерлараций) на товары, в соответствии с которой товар(часть, узел, агрегат товара)  был помещен 
										под таможенную процедуру свободной таможенной зоны, и номер товара в декларации (декларациях) на товары (сведения указываются, 
										если вывозится товар (часть, узел, агрегат товара), ранее помещенный под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair//*[local-name() = 'EquipmentGoods' or local-name() = 'TestingGoodsInfo']">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:for-each select="stz_aog:GoodsDecl">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="stz_aog:DeclRegNum" mode="reg_num_simple"/>
												<xsl:apply-templates select="stz_aog:CustomsDoc" mode="doc"/>
												<xsl:text> Товар №: </xsl:text>
												<xsl:for-each select="stz_aog:GoodsDeclnfo">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="stz_aog:GoodsNumber"/>
													<xsl:if test="stz_aog:GoodsQuantity">
														<xsl:text>, Кол-во: </xsl:text>
														<xsl:for-each select="stz_aog:GoodsQuantity">
															<xsl:if test="position() != 1">, </xsl:if>
															<xsl:apply-templates select="." mode="quantity"/>
														</xsl:for-each>
													</xsl:if>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										3. Реквизиты документа бухгалтерского учета (наименование, дата, номер), согласно которому вывозимый товар отражен в бухгалтерском учете организации, 
										являющейся резидентом особой экономической зоны, ил лица, которое в соответствии с Федеральным законом № 377-ФЗ имеет право помещать товар под таможенную 
										процедуру свободной таможенной зоны и (или) использовать товар, помещенный под таможенную процедуру свободной таможенной зоны (сведения указываются, 
										если товар, изготовленный (полученный) из товара, помещенного под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair//*[local-name() = 'EquipmentGoods' or local-name() = 'TestingGoodsInfo']/stz_aog:GoodsAccountDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										4. Цель вывоза и место (места) совершения Операций по ремонту и техническим испытаниям
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForRepair/stz_aog:RepairAndTestingOperations"/>
										<br/>
										<xsl:for-each select="stz_aog:GoodsForRepair/stz_aog:RepairAndTestingAddress">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="address"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										5. Лицо, которое непосредственно будет совершать Операции по ремонту и техническим испытаниям за пределами 
										территории особой экономической зоны, участка территории свободной экономической зоны на территориях Республики Крым и 
										города федерального значения Севастополя, на которых применяется таможенная процедура свободной таможенной зоны
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair/stz_aog:RepairAndTestingPerson">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:OrganizationName"/> 
											<xsl:if test="RUScat_ru:SubjectAddressDetails">
												<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="." mode="address"/>
												</xsl:for-each> 
											</xsl:if>
											<xsl:if test="cat_ru:RFOrganizationFeatures">
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"> ОГРН <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN"> ИНН <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP"> КПП <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="personID"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="descr">
										(наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое сокращенное наименование 
										предусмотрено учредительными документами юридического лица), ОГРН, ИНН, КПП, адрес в пределах места нахождения - для юридического лица; 
										фамилия, имя, отчество (при наличии), адрес регистрации физического лица по месту жительства, ИНН, ОГРНИП и сведения о документе, удостверяющем личность - 
										для индивидуального предпринимателя)
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										6. Реквизиты документов, на основании которых осуществляется передача вывозимого товара лицу, которое будет непосредственно свершать 
										Операции по ремонту и техническим испытаниям в отношении вывозимого товара
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair/stz_aog:ConfirmTransferDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										7. Срок обратного ввоза товара с учетом целей и обстоятельств вывоза такого товара
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForRepair/stz_aog:EntryGoodsTerm" mode="russian_date"/>
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
										<xsl:apply-templates select="stz_aog:ResidentSignature/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_aog:ResidentSignature/*[contains(local-name(), 'ame')]">
											<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top" class="descr">
									<td>(резидент особой экономической зоны, участник свободной экономической зоны на территориях Республики Крым и города федерального значения Севастополя)</td>
									<td></td>
									<td>(подпись)</td>
									<td></td>
									<td>(фамилия, имя, отчество (при наличии)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="stz_aog:OrderKind = 2 and stz_aog:DocKind = 2">
					<div class="page" style="width: {$w}mm;">
						<table border="0" style="width:297mm;">
							<tbody>
								<tr>
									<td align="left" style="width:167mm" valign="bottom">
										<span style="display:inline-block; width: 167mm;">
											Отметка таможенного органа
											<br/>
											Регистрационный № <xsl:call-template name="NotifNumber"/>
										</span>
									</td>
									<td>
										<table style="width:130mm">
											<tbody>
												<tr>
													<td align="left">
														<span class="incline">B </span>
														<xsl:apply-templates select="stz_aog:Customs/cat_ru:Code"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="stz_aog:Customs/cat_ru:OfficeName"/>
													</td>
												</tr>
												<tr align="center">
													<td class="graphLittle" style="border-top:1pt solid black">(наименование таможенного органа (с указанием кода таможенного органа)</td>
												</tr>
												<tr>
													<td align="left">
														<span class="incline">От </span>
														<xsl:apply-templates select="stz_aog:Resident/cat_ru:OrganizationName"/> 
														<xsl:if test="stz_aog:Resident/RUScat_ru:SubjectAddressDetails">
															<xsl:for-each select="stz_aog:Resident/RUScat_ru:SubjectAddressDetails">
																<xsl:text>, </xsl:text>
																<xsl:apply-templates select="." mode="address"/>
															</xsl:for-each> 
														</xsl:if>
														<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures">
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
														</xsl:if>
														<!--xsl:if test="stz_aog:Resident/stz_aog:CertificateNumber">
															свидетельство о включении в реестр № 
															<xsl:apply-templates select="stz_aog:Resident/stz_aog:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
															<xsl:apply-templates select="stz_aog:Resident/stz_aog:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
														</xsl:if-->
													</td>
												</tr>
												<tr>
													<td class="graphLittle" align="center" style="border-top:1pt solid black">
														<xsl:text>(наименование организации, содержащее указание на ее организацинно-правовую форму (сокращенное наименование, если такое скоращенное предусмотрено учредительными документами юридического лица), основной государственный регистрацинный номер (далее - ОГРН), идентификационный номер налогоплательщика (далее - ИНН), код причины постановки на учет в налоговом органе (далее - КПП), адрес в пределеах места нахождения - для юридического лица; фамилия, имя, отчество (при наличии), адрес регистрации физического лица по месту жительства, ИНН, основоной государаственный регистрационный номер индивидуального предпринимателя (далее - ОГРНИП) и сведения о документе, удостоверяющем личность - для индивидуального предпринимателя)</xsl:text>
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
										<xsl:text>Заявление</xsl:text><br/>
										<xsl:text>на совершение операций, предусмотренных подпунктом 5 пункта 4 статьи 205</xsl:text><br/>
										<xsl:text>Таможенного кодекса Евразийского экономического союза</xsl:text>
									</th>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										Прошу разрешить вывоз товара, помещенного под таможенную процедуру свободной таможенной зоны, и (или) 
										товара, изготовленного (полученного) из товаров, помещенных под таможенную процедуру свободной таможенной зоны 
										(далее - вывозимый товар), с территории особой экономиической зоны, с участка территории свободной экономической зоны на территориях 
										Республики Крым и города федерального значения Севастополя, на которых применяется процедура свободной таможнной зоны
										<xsl:apply-templates select="stz_aog:NameOfTerritory"/>
										, 
										для целей совершения операций, предусмотренных подпунктом 5 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза 
										(далее - Операции по переработке), согласно представленным ниже сведениям
										<xsl:if test="stz_aog:SheetsNumber">
											<xsl:text> на </xsl:text>
											<xsl:apply-templates select="stz_aog:SheetsNumber"/>
											<xsl:text> л.</xsl:text>
										</xsl:if>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="paragraph">
										1. Вывозимый товар с указанием наименования, количества в основной или дополнительной единице измерения, классификационного кода 
										в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза (далее - ТН ВЭД ЕАЭС)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:PlacedGoods">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_aog:GoodsDescription"/>
											<xsl:if test="stz_aog:GoodsTNVEDCode">
												<xsl:text>, Код ТН ВЭД </xsl:text>
												<xsl:apply-templates select="stz_aog:GoodsTNVEDCode"/>
											</xsl:if>
											<xsl:text> Количество: </xsl:text>
											<xsl:for-each select="stz_aog:GoodsQuantity">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										2. Товар, который будет получен (изготовлен) из вывозимого товара после совершения Операций по переработке (далее - получаемый товар), 
										с указанием наименования, классификационного кода в соответствии с ТН ВЭД ЕАЭС, количество в основных или дополнительных единицах измерения 
										в соответствии с ТН ВЭД ЕАЭС
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:GoodsResult">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_aog:GoodsDescription"/>
											<xsl:if test="stz_aog:GoodsTNVEDCode">
												<xsl:text>, Код ТН ВЭД </xsl:text>
												<xsl:apply-templates select="stz_aog:GoodsTNVEDCode"/>
											</xsl:if>
											<xsl:text> Количество: </xsl:text>
											<xsl:for-each select="stz_aog:GoodsQuantity">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										3. Товар Евразийского экономического союза, который будет использован при совершении Операций по переработке, 
										с указанием наименования, количество в основных или дополнительных единицах измерения в соответствии с ТН ВЭД ЕАЭС
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:GoodsResult">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_aog:GoodsDescription"/>
											<xsl:text> Количество: </xsl:text>
											<xsl:for-each select="stz_aog:GoodsQuantity">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										4. Номер декларации (номера дерлараций) на товары, в соответствии с которой (которыми) вывозимый товар  был помещен 
										под таможенную процедуру свободной таможенной зоны, и номер товара в декларации (декларациях) на товары
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:PlacedGoods/stz_aog:GoodsDeclaration">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:DeclRegNum" mode="reg_num_simple"/>
											<xsl:apply-templates select="stz_aog:CustomsDoc" mode="doc"/>
											<xsl:text> Товар №: </xsl:text>
											<xsl:for-each select="stz_aog:GoodsDeclnfo/stz_aog:GoodsNumber">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										5. Реквизиты документа бухгалтерского учета (наименование, дата, номер), согласно которому вывозимый товар отражен в бухгалтерском учете организации, 
										являющейся резидентом особой экономической зоны, или лица, которое в соответствии с Федеральным законом № 377-ФЗ имеет право помещать товар под 
										таможенную процедуру свободной таможенной зоны и (или) использовать товар, помещенный под таможенную процедуру свободной таможенной зоны 
										(сведения указываются, если вывозится товар, изготовленный (полученный) из товара, помещенного под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/*[local-name() = 'PlacedGoods' or local-name() = 'GoodsResult' or local-name() = 'EECGoods']/*[contains(local-name(),'AccountDoc')]">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										6. Операции по переработке, которые являются составной частью производственного процесса и будут совершаться за пределами особой экономической зоны, 
										участка территории свободной экономической зоны на территориях Республики Крым и города федерального значения Севастополя, 
										а также технологии их совершения
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:ProcessingOperations">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										7. Причины, препятствующие совершению на территории собой экономической зоны, участке территории свободной экономической зоны, 
										на которых применяется таможенная процедура свободной таможенной зоны, Операций по переработке, которые будут совершаться 
										за пределами территории особой экономической зоны, участка территории свободной экономической зоны на территория Республики Крым и 
										города федерального значения Севастополя, на которых применяется таможенная процедура свободной таможенной зоны
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForProcessing/stz_aog:Reason"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										8. Лицо (лица), непосредственно совершающее Операции по переработке за пределами территории особой экономической зоны, участка территории 
										свободной экономической зоны на территориях Республики Крым и города федерального значения Севастополя, на которых применяется 
										таможенная процедура свободной таможенной зоны
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:ProcessingPerson">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:OrganizationName"/> 
											<xsl:if test="RUScat_ru:SubjectAddressDetails">
												<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="." mode="address"/>
												</xsl:for-each> 
											</xsl:if>
											<xsl:if test="cat_ru:RFOrganizationFeatures">
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"> ОГРН <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN"> ИНН <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP"> КПП <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="personID"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="descr">
										(наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое сокращенное наименование 
										предусмотрено учредительными документами юридического лица), ОГРН, ИНН, КПП, адрес в пределах места нахождения - для юридического лица; 
										фамилия, имя, отчество (при наличии), адрес регистрации физического лица по месту жительства, ИНН, ОГРНИП и сведения о документе, удостверяющем личность - 
										для индивидуального предпринимателя)
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										9. Место (места) (с указанием адреса) совершения Операций по переработке
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:ProcessingPlace">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="address"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										10. Реквизиты документов, на основарии которых осуществляется передача вывозимого товара лицу, 
										которое будет непосредственно совершать Операции по переработке в отношении вывозимого товара
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:ConfirmTransferDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										11. Сроки совершения Операций по переработке с учетом продолжительности производственного процесса и времени перевозки товаров от 
										территории особой экономической зоны, участка территории свободной экономической зоны, на которых применяется таможенная процедура 
										свободной таможенной зоны, до места (мест) совершения таких операций и обратно
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForProcessing/stz_aog:ProcessingTerm" mode="russian_date"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										12. Предлагаемые способы идентификации вывозимого товара в получаемом товаре при его последующем ввозе на территорию 
										особой экономической зоны, участок территории свободной экономической зоны на территориях Республики Крым и города 
										федерального значения Севастополя, на которых применяется таможенная процедура свободной таможенной зоны
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForProcessing/stz_aog:MethodIdentify"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										13. Нормы расхода вывозимого товара на единицу получаемого товара или нормы выхода получаемого товара
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForProcessing/stz_aog:YieldNorm"/>
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
										<xsl:apply-templates select="stz_aog:ResidentSignature/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_aog:ResidentSignature/*[contains(local-name(), 'ame')]">
											<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top" class="descr">
									<td>(резидент особой экономической зоны, участник свободной экономической зоны на территориях Республики Крым и города федерального значения Севастополя)</td>
									<td></td>
									<td>(подпись)</td>
									<td></td>
									<td>(фамилия, имя, отчество (при наличии)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="stz_aog:OrderKind = 3 and stz_aog:DocKind = 1">
					<div class="page" style="width: {$w}mm;">
						<table border="0" style="width:297mm;">
							<tbody>
								<tr>
									<td align="left" style="width:167mm" valign="bottom">
										<span style="display:inline-block; width: 167mm;">
											№ <xsl:call-template name="NotifNumber"/>
										</span>
									</td>
									<td>
										<table style="width:130mm">
											<tbody>
												<tr>
													<td align="left">
														<span class="incline">B </span>
														<xsl:apply-templates select="stz_aog:Customs/cat_ru:Code"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="stz_aog:Customs/cat_ru:OfficeName"/>
													</td>
												</tr>
												<tr align="center">
													<td class="graphLittle" style="border-top:1pt solid black">(наименование таможенного органа (с указанием кода таможенного органа)</td>
												</tr>
												<tr>
													<td align="left">
														<span class="incline">От </span>
														<xsl:apply-templates select="stz_aog:Resident/cat_ru:OrganizationName"/> 
														<xsl:if test="stz_aog:Resident/RUScat_ru:SubjectAddressDetails">
															<xsl:for-each select="stz_aog:Resident/RUScat_ru:SubjectAddressDetails">
																<xsl:text>, </xsl:text>
																<xsl:apply-templates select="." mode="address"/>
															</xsl:for-each> 
														</xsl:if>
														<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures">
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
														</xsl:if>
														<!--xsl:if test="stz_aog:Resident/stz_aog:CertificateNumber">
															свидетельство о включении в реестр № 
															<xsl:apply-templates select="stz_aog:Resident/stz_aog:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
															<xsl:apply-templates select="stz_aog:Resident/stz_aog:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
														</xsl:if-->
													</td>
												</tr>
												<tr>
													<td class="graphLittle" align="center" style="border-top:1pt solid black">
														<xsl:text>(участник свободной экономической зоны на территориях Донецкой Народной Республики, Луганской Народной Республики, Запорожской области и Херсонской области (наименование 
														организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое сокращенное наименование предусмотрено учредительным документом юридического 
														лица), основной государственный регистрационный номер (ОГРН), идентификационный номер налогоплательщика (ИНН) и код причины постановки на учет в налоговом органе (КПП), присвоенные 
														юридическому лицу в соответствии в законодательством Российской Федерации, адрес в пределах места нахождения юридического лица - для юридического лица; фамилия, имя, отчество (при наличии), 
														место жительства или место пребывания физического лица, идентификационный номер налогоплательщика (ИНН), основной государственный регистрационный номер индивидуального предпринимателя 
														(ОГРНИП) и сведения о документе, удостоверяющем личность физического лица - для физического лица (индивидуального предпринимателя)
														</xsl:text>
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
										<xsl:text>Заявление</xsl:text><br/>
										<xsl:text>на совершение операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205</xsl:text><br/>
										<xsl:text>Таможенного кодекса Евразийского экономического союза</xsl:text>
									</th>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										Прошу разрешить вывоз товаров, помещенного под таможенную процедуру свободной таможенной зоны, и (или) 
										товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, 
										с земельных участков, расположенных в свободной экономической зоне, которые находятся во владении, в том числе в аренде, 
										у участников свободной экономической зоны на территориях Донецкой Народной Республики, Луганской Народной Республики, 
										Запорожской области или Херсонской области (далее - участники СЭЗ) и на которых создана зона таможенного контроля, и (или) 
										в граница водных участков, которые располагаются во внутренних морских водах и в территориальном море Российской Федерации, 
										примыкающих к территориям Донецкой Народной Республики, Запорожской области и Херсонской области, и находятся во владении, 
										в том числе в аренде, у участников СЭЗ и на которых создана зона таможенного контроля 
										для целей совершения операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза 
										(далее соответственно - Операции по ремонту и техническим испытаниям), согласно представленным ниже сведениям
										<xsl:if test="stz_aog:SheetsNumber">
											<xsl:text> на </xsl:text>
											<xsl:apply-templates select="stz_aog:SheetsNumber"/>
											<xsl:text> л.</xsl:text>
										</xsl:if>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="paragraph">
										1. Наименование товара и его характеристики
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair//*[local-name() = 'EquipmentGoods' or local-name() = 'TestingGoodsInfo']">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_aog:GoodsDescription"/>
											<xsl:if test="stz_aog:GoodsTNVEDCode">
												<xsl:text>, Код ТН ВЭД </xsl:text>
												<xsl:apply-templates select="stz_aog:GoodsTNVEDCode"/>
											</xsl:if>
											<xsl:if test="stz_aog:GoodsQuantity">
												<xsl:text>, Кол-во: </xsl:text>
												<xsl:for-each select="stz_aog:GoodsQuantity">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="stz_aog:GoodsGroupInformation">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:for-each select="stz_aog:GoodsGroupInformation">
												<xsl:if test="position() != 1">; </xsl:if>
												<xsl:for-each select="*[local-name() = 'Manufacturer' or local-name() = 'Trademark' or local-name() = 'GoodMarking' or local-name() = 'GoodsMark' or local-name() = 'GoodsModel' or local-name() = 'GoodsStandard' or local-name() = 'GoodsSort']">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										2. Номер декларации (номера дерлараций) на товары, в соответствии с которой товары(части, узлы, агрегаты товаров)  были помещены 
										под таможенную процедуру свободной таможенной зоны, и (или) товары (части, узлы, агрегаты товаров), изготовленные (полученные) из товаров, 
										помещенных под таможенную процедуру свободной таможенной зоны, и предназначенные для вывоза (далее - вывозимые товары), были помещены под 
										таможенную процедуру свободной таможенной зоны, и номера товаров в декларации (декларациях) на товары (сведения указываются, если вывозятся 
										товары (части, узлы, агрегаты товаров), ранее помещенные под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair//*[local-name() = 'EquipmentGoods' or local-name() = 'TestingGoodsInfo']">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:for-each select="stz_aog:GoodsDecl">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="stz_aog:DeclRegNum" mode="reg_num_simple"/>
												<xsl:apply-templates select="stz_aog:CustomsDoc" mode="doc"/>
												<xsl:text> Товар №: </xsl:text>
												<xsl:for-each select="stz_aog:GoodsDeclnfo">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="stz_aog:GoodsNumber"/>
													<xsl:if test="stz_aog:GoodsQuantity">
														<xsl:text>, Кол-во: </xsl:text>
														<xsl:for-each select="stz_aog:GoodsQuantity">
															<xsl:if test="position() != 1">, </xsl:if>
															<xsl:apply-templates select="." mode="quantity"/>
														</xsl:for-each>
													</xsl:if>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										3. Реквизиты документа бухгалтерского учета (наименование, дата, номер), согласно которому вывозимые товары, изготовленные (полученные) из товаров, 
										помещенных под таможенную процедуру свободной таможенной зоны, отражены в бухгалтерском учете участника (сведения указываются, 
										если вывозятся товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair//*[local-name() = 'EquipmentGoods' or local-name() = 'TestingGoodsInfo']/stz_aog:GoodsAccountDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										4. Цель вывоза и место (места) совершения Операций по ремонту и техническим испытаниям
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForRepair/stz_aog:RepairAndTestingOperations"/>
										<br/>
										<xsl:for-each select="stz_aog:GoodsForRepair/stz_aog:RepairAndTestingAddress">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="address"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										5. Лицо (лица), которое непосредственно будет совершать Операции по ремонту и техническим испытаниям за пределами участка территории 
										свободной экономической зоны, на котором применяется таможенная процедура свободной таможенной зоны, о лице, которое в соответствии с 
										настоящим Федеральным законом имеет право моещать товары под таможенную процедуру свободной таможенной зоны и (или) использовать товары, 
										помещенные под таможенную процедуру свободной таможенной зоны
									</td>
								</tr>
								<tr>
									<td class="descr" style="border-top: 1px solid black;">
										(наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое сокращенное наименование 
										предусмотрено учредительными документами юридического лица), ОГРН, ИНН, КПП, адрес в пределах места нахождения - для юридического лица; 
										фамилия, имя, отчество (при наличии), адрес регистрации физического лица по месту жительства, ИНН, ОГРНИП и сведения о документе, удостверяющем личность - 
										для индивидуального предпринимателя)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair/stz_aog:RepairAndTestingPerson">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:OrganizationName"/> 
											<xsl:if test="RUScat_ru:SubjectAddressDetails">
												<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="." mode="address"/>
												</xsl:for-each> 
											</xsl:if>
											<xsl:if test="cat_ru:RFOrganizationFeatures">
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"> ОГРН <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN"> ИНН <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP"> КПП <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="personID"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										6. Реквизиты документа (документов), подтверждающего передачу вывозимого товара лицу, которое будет непосредственно совершать Операции 
										по ремонту и техническим испытаниям в отношении вывозимых товаров
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForRepair/stz_aog:ConfirmTransferDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										7. Срок обратного ввоза товаров с учетом целей и обстоятельств вывоза такогих товаров
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForRepair/stz_aog:EntryGoodsTerm" mode="russian_date"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										8. Реквизиты свидетельства о включении в единый реестр участников свободной экономическо зоны на территориях 
										Донецкой Народной Республики, Луганской Народной Республики, Запорожской области или Херсонской области
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:PresentedDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
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
										<xsl:apply-templates select="stz_aog:ResidentSignature/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_aog:ResidentSignature/*[contains(local-name(), 'ame')]">
											<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top" class="descr">
									<td>(участник СЭЗ)</td>
									<td></td>
									<td>(подпись)</td>
									<td></td>
									<td>(фамилия, имя, отчество (при наличии)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="stz_aog:OrderKind = 3 and stz_aog:DocKind = 2">
					<div class="page" style="width: {$w}mm;">
						<table border="0" style="width:297mm;">
							<tbody>
								<tr>
									<td align="left" style="width:167mm" valign="bottom">
										<span style="display:inline-block; width: 167mm;">
											Регистрационный № <xsl:call-template name="NotifNumber"/>
										</span>
									</td>
									<td>
										<table style="width:130mm">
											<tbody>
												<tr>
													<td align="left">
														<span class="incline">B </span>
														<xsl:apply-templates select="stz_aog:Customs/cat_ru:Code"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="stz_aog:Customs/cat_ru:OfficeName"/>
													</td>
												</tr>
												<tr align="center">
													<td class="graphLittle" style="border-top:1pt solid black">(наименование таможенного органа (с указанием кода таможенного органа)</td>
												</tr>
												<tr>
													<td align="left">
														<span class="incline">От </span>
														<xsl:apply-templates select="stz_aog:Resident/cat_ru:OrganizationName"/> 
														<xsl:if test="stz_aog:Resident/RUScat_ru:SubjectAddressDetails">
															<xsl:for-each select="stz_aog:Resident/RUScat_ru:SubjectAddressDetails">
																<xsl:text>, </xsl:text>
																<xsl:apply-templates select="." mode="address"/>
															</xsl:for-each> 
														</xsl:if>
														<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures">
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
															<xsl:if test="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="stz_aog:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
														</xsl:if>
														<!--xsl:if test="stz_aog:Resident/stz_aog:CertificateNumber">
															свидетельство о включении в реестр № 
															<xsl:apply-templates select="stz_aog:Resident/stz_aog:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
															<xsl:apply-templates select="stz_aog:Resident/stz_aog:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
														</xsl:if-->
													</td>
												</tr>
												<tr>
													<td class="graphLittle" align="center" style="border-top:1pt solid black">
														<xsl:text>(участник свободной экономической зоны на территориях Донецкой Народной Республики, Луганской Народной Республики, Запорожской области и Херсонской области (наименование 
														организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое сокращенное наименование предусмотрено учредительным документом юридического 
														лица), основной государственный регистрационный номер (ОГРН), идентификационный номер налогоплательщика (ИНН) и код причины постановки на учет в налоговом органе (КПП), присвоенные 
														юридическому лицу в соответствии в законодательством Российской Федерации, адрес в пределах места нахождения юридического лица - для юридического лица; фамилия, имя, отчество (при наличии), 
														место жительства или место пребывания физического лица, идентификационный номер налогоплательщика (ИНН), основной государственный регистрационный номер индивидуального предпринимателя 
														(ОГРНИП) и сведения о документе, удостоверяющем личность физического лица - для физического лица (индивидуального предпринимателя)
														</xsl:text>
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
										<xsl:text>Заявление</xsl:text><br/>
										<xsl:text>на совершение операций, предусмотренных подпунктом 5 пункта 4 статьи 205</xsl:text><br/>
										<xsl:text>Таможенного кодекса Евразийского экономического союза</xsl:text>
									</th>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										Прошу разрешить вывоз товаров, помещенных под таможенную процедуру свободной таможенной зоны, и (или) 
										товаров, изгоовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны (далее - вывозимые товары), 
										с земельных участков, расположенных в свободной экономической зоне, котороые находятся во владении, в том числе в аренде, у участников 
										свободной экономической зоны на территориях Донецкой Народной Республики, Луганской Народной Республики, Запорожской области или 
										Херсонской области (далее - участники СЭЗ) и на которых создана зона таможенного контроля, и (или) в границах водных участков, 
										которые располагаются во внутренних морских водах и в территориальном море Российской Федерации, примыкающих к территориям 
										Донецкой Народной Республики, Запорожской области и Херсонской области, и находятся во владении, в том числе в аренде, у участников СЭЗ 
										и на которых создана зона таможенного контроля для целей совершения операций, предусмотренных подпунктом 5 пункта 4 статьи 205 
										Таможенного кодекса Евразийского экономического союза (далее - Операции по переработке), согласно представленным ниже сведениям
										<xsl:if test="stz_aog:SheetsNumber">
											<xsl:text> на </xsl:text>
											<xsl:apply-templates select="stz_aog:SheetsNumber"/>
											<xsl:text> л.</xsl:text>
										</xsl:if>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="paragraph">
										1. Вывозимые товары с указанием наименований, классификационных кодов в соответствии с единой Товарной номенклатурой 
										внешнеэкономической деятельности Евразийского экономического союза (далее - ТН ВЭД ЕАЭС), количества в основных или дополнительных 
										единицах измерения
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:PlacedGoods">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_aog:GoodsDescription"/>
											<xsl:if test="stz_aog:GoodsTNVEDCode">
												<xsl:text>, Код ТН ВЭД </xsl:text>
												<xsl:apply-templates select="stz_aog:GoodsTNVEDCode"/>
											</xsl:if>
											<xsl:text> Количество: </xsl:text>
											<xsl:for-each select="stz_aog:GoodsQuantity">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										2. Товары, которые будут получены из вывозимых товаров после совершения Операций по переработке (далее - получаемые товары), 
										с указанием наименования, классификационного кода в соответствии с ТН ВЭД ЕАЭС, количество в основных или дополнительных единицах измерения 
										в соответствии с ТН ВЭД ЕАЭС
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:GoodsResult">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_aog:GoodsDescription"/>
											<xsl:if test="stz_aog:GoodsTNVEDCode">
												<xsl:text>, Код ТН ВЭД </xsl:text>
												<xsl:apply-templates select="stz_aog:GoodsTNVEDCode"/>
											</xsl:if>
											<xsl:text> Количество: </xsl:text>
											<xsl:for-each select="stz_aog:GoodsQuantity">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										3. Товары Евразийского экономического союза, которые будут использованы при совершении Операций по переработке, 
										с указанием наименования, количество в основных или дополнительных единицах измерения в соответствии с ТН ВЭД ЕАЭС
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:GoodsResult">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_aog:GoodsDescription"/>
											<xsl:text> Количество: </xsl:text>
											<xsl:for-each select="stz_aog:GoodsQuantity">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										4. Номер декларации (номера дерлараций) на товары, в соответствии с которой (которыми) вывозимые товары  были помещены 
										под таможенную процедуру свободной таможенной зоны, и номера товаров в декларации (декларациях) на товары
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:PlacedGoods/stz_aog:GoodsDeclaration">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_aog:DeclRegNum" mode="reg_num_simple"/>
											<xsl:apply-templates select="stz_aog:CustomsDoc" mode="doc"/>
											<xsl:text> Товар №: </xsl:text>
											<xsl:for-each select="stz_aog:GoodsDeclnfo/stz_aog:GoodsNumber">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										5. Реквизиты документа бухгалтерского учета (наименование, дата, номер), согласно которому вывозимые товары, изготовленные (полученные) из товаров, помещенных 
										под таможенную процедуру свободной таможенной зоны, отражены в бухгалтерском учете лицом, которое в соответствии с Федеральным законом от 24 июня 2023 г. № 266-ФЗ 
										"О свободной экономической зоне на территориях Донецкой Народной Республики, Луганской Народной Республики, Запорожской области и Херсонской области" имеет право 
										помещать товары под таможенную процедуру свободной таможенной зоны и (или) использовать товары, помещенные под таможенную процедуру свободной таможенной зоны 
										(сведения указываются, если вывозятся товары, изтоговленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/*[local-name() = 'PlacedGoods' or local-name() = 'GoodsResult' or local-name() = 'EECGoods']/*[contains(local-name(),'AccountDoc')]">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										6. Операции, которые являются составлной частью производственного процесса и будут совершаться за пределами участка территории 
										свободной экономической зоны, на котором применяется таможенная процедура свободной таможенной зоны, а так же о технологии их совершения
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:ProcessingOperations">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										7. Причины, препятствующие совершению на участке территории собой экономической зоны,  
										на которых применяется таможенная процедура свободной таможенной зоны, Операций по переработке, которые будут совершаться 
										за пределами такого участка
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForProcessing/stz_aog:Reason"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										8. Лицо (лица), непосредственно совершающее Операции по переработке за пределами территории особой экономической зоны, 
										на котором применяется таможенная процедура свободной таможенной зоны
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:ProcessingPerson">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:OrganizationName"/> 
											<xsl:if test="RUScat_ru:SubjectAddressDetails">
												<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="." mode="address"/>
												</xsl:for-each> 
											</xsl:if>
											<xsl:if test="cat_ru:RFOrganizationFeatures">
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"> ОГРН <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN"> ИНН <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP"> КПП <xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="personID"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="descr">
										(наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое сокращенное наименование 
										предусмотрено учредительными документами юридического лица), ОГРН, ИНН, КПП, адрес в пределах места нахождения - для юридического лица; 
										фамилия, имя, отчество (при наличии), адрес регистрации физического лица по месту жительства, ИНН, ОГРНИП и сведения о документе, удостверяющем личность - 
										для индивидуального предпринимателя)
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										9. Место (места) (с указанием адреса) совершения Операций по переработке
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:ProcessingPlace">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="address"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										10. Реквизиты документов, подтверждающих передачу вывозимых товаров лицу (лицам), 
										которое будет непосредственно совершать Операции по переработке в отношении вывозимых товаров
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_aog:GoodsForProcessing/stz_aog:ConfirmTransferDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										11. Сроки совершения Операций по переработке с учетом продолжительности производственного процесса и времени перевозки товаров от 
										территории особой экономической зоны, участка территории свободной экономической зоны, на которых применяется таможенная процедура 
										свободной таможенной зоны, до места совершения таких операций и обратно
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForProcessing/stz_aog:ProcessingTerm" mode="russian_date"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										12. Предлагаемые способы идентификации вывозимых товаров в получаемых товарах при их последующем ввозе на участок территории 
										особой экономической зоны, на котором применяется таможенная процедура свободной таможенной зоны
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForProcessing/stz_aog:MethodIdentify"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										13. Нормы расхода вывозимых товаров на единицу получаемых товаров или нормы выхода получаемых товаров
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_aog:GoodsForProcessing/stz_aog:YieldNorm"/>
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
										<xsl:apply-templates select="stz_aog:ResidentSignature/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_aog:ResidentSignature/*[contains(local-name(), 'ame')]">
											<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top" class="descr">
									<td>(участник СЭЗ)</td>
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
	<xsl:template match="stz_aog:ProcessingOperations">
		<xsl:for-each select="stz_aog:Position">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="stz_aog:Operation"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="stz_aog:TechnologicalProcess"/>
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
				<xsl:apply-templates select="stz_aog:RegistrationNumber" mode="reg_num"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="reg_num">
		<table class="inlinetable" style="width: 25mm;">
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
		<table class="inlinetable" style="width: 25mm;">
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
	<xsl:template match="//*[local-name()='STZ_AppOperationsGoods']//*" priority="-1">
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
