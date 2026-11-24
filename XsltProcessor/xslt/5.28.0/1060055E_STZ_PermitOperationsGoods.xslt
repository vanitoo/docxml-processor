<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:stz_pog="urn:customs.ru:Information:ExchangeDocuments:STZ_PermitOperationsGoods:5.28.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0">
	
	<xsl:param name="STZ_NotifReg"/>
	
	<xsl:template match="stz_pog:STZ_PermitOperationsGoods">
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
				<xsl:if test="stz_pog:OrderKind = 1 and stz_pog:DocKind = 1">
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
															наименование организации, содержащее указание на ее организацинно-правовую форму (сокращенное наименование, 
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
										<xsl:text>Разрешение</xsl:text><br/>
										<xsl:text>таможенного органа на совершение операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205</xsl:text><br/>
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
													<td>Настоящее разрешение выдано</td>
													<td style="width: 210mm;">
														<table class="inlinetable" style="width: 100%;">
															<tbody>
																<tr align="center">
																	<td class="value" width="100%;">
																		<xsl:apply-templates select="stz_pog:Resident" mode="org"/>
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
										и свидетельствует о возможности вывоза с земельного участка, предоставленного резиденту свободного порта Владивосток, территории участка 
										резидента Арктической зоны Российской Федерации, земельного участка, предоставленного резиденту территории опережающего развития, на остальную 
										часть таможенной территории Евразийского экономического союза по заявлению № 
										<xsl:apply-templates select="stz_pog:AppRegNumber" mode="reg_num_simple"/> 
										товара, помещенного под таможенную процедуру свободной экономической зоны, и (или) товара, изготовленного (полученного) из товара, помещенного 
										под таможенную процедуру свободной таможенной зоны (далее - вывозимый товар), для целей совершения в отношении товара операций, предусмотренных 
										подпунктами 1 и 2 пункта 4 статьи 205 Таможеннго кодекса Евразийского экономического союза (далее - Операции по ремонту и техническим испытаниям)
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="paragraph">
										1. Лицо (лица), которое непосредственно будет совершать Операции по ремонту и техническим испытаниям за пределами 
										земельного участка, предоставленного резиденту свободного порта Владивосток, территории участка резидента Арктической зоны 
										Российской Федерации, земельного участка, представленного резиденту территории опережающего развития
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair/stz_pog:RepairAndTestingPerson">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="org"/>
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
										2. Наименование товара и его характеристики
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair//*[local-name() = 'RepairGoodsInfo' or local-name() = 'TestingGoodsInfo']">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_pog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_pog:GoodsDescription"/>
											<xsl:text> </xsl:text>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="descr">
										(сведения о товаре, позволяющие идентифицировать его при вывозе и обратном ввозе на территорию участка, и его количество. Наименование, вид (класс) 
										оборудования или иных товаров, являющихся производственными средства, помещенными под таможенную процедуру свободной таможенной зоны и введенными 
										в эксплуатацию (далее - оборудование), в соответствии с документами бухгалтерского учета, если товар вывозится в соответствии с подпунктом 1 пункта 4 
										статьи 205 ТК ЕАЭС, в том числе, если вывозятся части, узлы, агрегаты оборудования (с указанием наименования и реквизитов документа, свидетельствующего 
										о постановке оборудования на баланс резидента и вводе его в эксплуатацию)
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										3. Номер декларации (номера дерлараций) на товары, в соответствии с которой товар(часть, узел, агрегат товара)  был помещен 
										под таможенную процедуру свободной таможенной зоны, и номер товара в декларации (декларациях) на товары (сведения указываются, 
										если вывозится товар (часть, узел, агрегат товара), ранее помещенный под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair//*[local-name() = 'RepairGoodsInfo' or local-name() = 'TestingGoodsInfo']/stz_pog:AccountDoc[contains(cat_ru:PrDocumentName, 'NumDT')]">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:value-of select="substring(normalize-space(cat_ru:PrDocumentName), 6)"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date_gtd"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										4. Реквизиты документа бухгалтерского учета (наименование, дата, номер), согласно которому вывозимый товар отражен в бухгалтерском учете организации, 
										являющейся резидентом территории опережающего развития, свободного порта Владивосток, Арктической зоны Российской Федерации (сведения указываются, 
										если вывозится товар, изготовленный (полученный) из товара, помещенного под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair//*[local-name() = 'RepairGoodsInfo' or local-name() = 'TestingGoodsInfo']/stz_pog:AccountDoc[not(contains(cat_ru:PrDocumentName, 'NumDT'))]">
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
										5. Цель вывоза и место (места) (с указанием адреса) совершения Операций по ремонту и техническим испытаниям
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_pog:GoodsForRepair/stz_pog:RepairAndTestingOperations"/>
										<br/>
										<xsl:for-each select="stz_pog:GoodsForRepair/stz_pog:RepairAndTestingAddress">
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
										6. Реквизиты документов, подтверждающих передачу вывозимого товара лицу, которое будет непосредственно совершать Операции 
										по ремонту и техническим испытаниям в отношении вывозимого товара
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair/stz_pog:ConfirmTransferDoc">
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
										<xsl:apply-templates select="stz_pog:EntryGoodsTerm" mode="russian_date"/>
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
										<xsl:apply-templates select="stz_pog:CustomsPerson/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_pog:CustomsPerson/*[contains(local-name(), 'ame')]">
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
				<xsl:if test="stz_pog:OrderKind = 1 and stz_pog:DocKind = 2">
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
										<xsl:text>Разрешение</xsl:text><br/>
										<xsl:text>таможенного органа на совершение операций, предусмотренных подпунктом 5 пункта 4 статьи 205</xsl:text><br/>
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
													<td>Настоящее разрешение выдано</td>
													<td style="width: 210mm;">
														<table class="inlinetable" style="width: 100%;">
															<tbody>
																<tr align="center">
																	<td class="value" width="100%;">
																		<xsl:apply-templates select="stz_pog:Resident" mode="org"/>
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
										и свидетельствует о возможности вывоза с земельного участка, предоставленного резиденту свободного порта Владивосток, территории участка 
										резидента Арктической зоны Российской Федерации, земельного участка, предоставленного резиденту территории опережающего развития, на остальную 
										часть таможенной территории Евразийского экономического союза по заявлению № 
										<xsl:apply-templates select="stz_pog:AppRegNumber" mode="reg_num_simple"/> 
										товара, помещенного под таможенную процедуру свободной экономической зоны, и (или) товара, изготовленного (полученного) из товара, помещенного 
										под таможенную процедуру свободной таможенной зоны (далее - вывозимый товар), для целей совершения в отношении товара операций, предусмотренных 
										подпунктом 5 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза (далее - Операции по переработке)
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="paragraph">
										1. Лицо (лица), которое непосредственно будет совершать Операции по переработке за пределами 
										земельного участка, предоставленного резиденту свободного порта Владивосток, территории участка резидента Арктической зоны 
										Российской Федерации, земельного участка, представленного резиденту территории опережающего развития
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:ProcessingPerson">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="org"/>
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
										2. Вывозимый товар с указанием наименований, классификационных кодов в соответствии с единой Товарной номенклатурой внешнеэкономической 
										деятельности Евразийского экономического союза (далее - ТН ВЭД ЕАЭС)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:PlacedGoods">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_pog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_pog:GoodsDescription"/>
											<xsl:text> </xsl:text>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										3. Получаемый товар с указанием наименований, классификационных кодов в соответствии с единой Товарной номенклатурой внешнеэкономической 
										деятельности Евразийского экономического союза (далее - ТН ВЭД ЕАЭС)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:GoodsResult">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_pog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_pog:GoodsDescription"/>
											<xsl:text> </xsl:text>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										4. Номер декларации (номера дерлараций) на товары, в соответствии с которой товар(часть, узел, агрегат товара)  был помещен 
										под таможенную процедуру свободной таможенной зоны, и номер товара в декларации (декларациях) на товары
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:GoodsAccountDoc[contains(cat_ru:PrDocumentName, 'NumDT')]">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:value-of select="substring(normalize-space(cat_ru:PrDocumentName), 6)"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date_gtd"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										5. Реквизиты документа бухгалтерского учета (наименование, дата, номер), согласно которому вывозимый товар отражен в бухгалтерском учете организации, 
										являющейся резидентом территории опережающего развития, свободного порта Владивосток (сведения указываются, 
										если вывозится товар, изготовленный (полученный) из товара, помещенного под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:GoodsAccountDoc[not(contains(cat_ru:PrDocumentName, 'NumDT'))]">
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
										6. Операции по переработке, которые являются составной частью производственного процесса и будут совершаться за пределами земельного участка, 
										предоставленного резиденту свободного порта Владивосток, территории участка резидента Арктической зоны Российской Федерации, земельного участка, 
										предоставленного резиденту территории опережающего развития, а также технологии их совершения
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:ProcessingOperations">
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
										7. Место (места) (с указанием адреса) совершения Операций по переработке
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:ProcessingPlace">
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
										8. Реквизиты документов, на основании которых осуществляется передача вывозимого товара (реквизиты документоа (документов), подтверждающего 
										передачу вывозимого товара) лицу, которое будет непосредственно совершать Операции по переработке в отношении вывозимого товара
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:ConfirmTransferDoc">
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
										9. Срок ввоза получаемого товара (или вывозимого товара, если Операции по переработке не совершались по объективным причинам) 
										на земельный участок, предоставленный резиденту свободного порта Владивосток, территорию участка резидента Арктической зоны Российской Федерации, 
										земельный участок, предоставленный резиденту территории опережающего развития
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_pog:EntryGoodsTerm" mode="russian_date"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										10. Способы идентификации вывозимого товара в получаемом товаре
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_pog:GoodsForProcessing/stz_pog:MethodIdentify"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										11. Нормы расхода вывозимого товара на единицу получаемого товара или нормы выхода получаемого товара 
										с учетом использования товара Евразийского экономического союза
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_pog:GoodsForProcessing/stz_pog:YieldNorm"/>
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
										<xsl:apply-templates select="stz_pog:CustomsPerson/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_pog:CustomsPerson/*[contains(local-name(), 'ame')]">
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
				<xsl:if test="stz_pog:OrderKind = 2 and stz_pog:DocKind = 1">
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
										<xsl:text>Разрешение</xsl:text><br/>
										<xsl:text>таможенного органа на совершение операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205</xsl:text><br/>
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
													<td>Настоящее разрешение выдано</td>
													<td style="width: 210mm;">
														<table class="inlinetable" style="width: 100%;">
															<tbody>
																<tr align="center">
																	<td class="value" width="100%;">
																		<xsl:apply-templates select="stz_pog:Resident" mode="org"/>
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
										и свидетельствует о возможности вывоза с территории особой экономической зоны, с участка территории свободной экономической зоны, 
										на которой применяется процедура свободной таможенной зоны на остальную часть таможенной территории Евразийского экономического союза 
										по заявлению № 
										<xsl:apply-templates select="stz_pog:AppRegNumber" mode="reg_num_simple"/> 
										товара, помещенного под таможенную процедуру свободной экономической зоны, и (или) товара, изготовленного (полученного) из товара, помещенного 
										под таможенную процедуру свободной таможенной зоны (далее - вывозимый товар), для целей совершения в отношении товара операций, предусмотренных 
										подпунктами 1 и 2 пункта 4 статьи 205 Таможеннго кодекса Евразийского экономического союза (далее - Операции по ремонту и техническим испытаниям)
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="paragraph">
										1. Лицо (лица), которое непосредственно будет совершать Операции по ремонту и техническим испытаниям за пределами 
										территории особой экономической зоны, участка территории особой экономической зоны на территориях Республики Крым и города федерального 
										значения Севатополя (далее - Участок), на которых применяется таможенная процедура свободной таможенной зоны
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair/stz_pog:RepairAndTestingPerson">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="org"/>
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
										2. Наименование товара и его характеристики
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair//*[local-name() = 'RepairGoodsInfo' or local-name() = 'TestingGoodsInfo']">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_pog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_pog:GoodsDescription"/>
											<xsl:text> </xsl:text>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										3. Номер декларации (номера дерлараций) на товары, в соответствии с которой товар(часть, узел, агрегат товара)  был помещен 
										под таможенную процедуру свободной таможенной зоны, и номер товара в декларации (декларациях) на товары (сведения указываются, 
										если вывозится товар (часть, узел, агрегат товара), ранее помещенный под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair//*[local-name() = 'RepairGoodsInfo' or local-name() = 'TestingGoodsInfo']/stz_pog:AccountDoc[contains(cat_ru:PrDocumentName, 'NumDT')]">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:value-of select="substring(normalize-space(cat_ru:PrDocumentName), 6)"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date_gtd"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										4. Реквизиты документа бухгалтерского учета (наименование, дата, номер), согласно которому товар, изготовленный (полученный) из товара, 
										помещенного под таможенную процедуру свободной таможенной зоны, отражен в бухгалтерском учете организации, являющейся резидентом 
										особой экономической зоны, или лица, которое в соответствии Федеральным законом № 377-ФЗ имеет право помещать товар под таможенную 
										процедуру свободной таможенной зоны и (или) использовать товар, помещенный под таможенную процедуру свободной таможнной зоны (сведения 
										указываются, если вывозится товар, изготовленный (полученный) из товара, помещенного под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair//*[local-name() = 'RepairGoodsInfo' or local-name() = 'TestingGoodsInfo']/stz_pog:AccountDoc[not(contains(cat_ru:PrDocumentName, 'NumDT'))]">
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
										5. Цель вывоза и место (места) (с указанием адреса) совершения Операций по ремонту и техническим испытаниям
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_pog:GoodsForRepair/stz_pog:RepairAndTestingOperations"/>
										<br/>
										<xsl:for-each select="stz_pog:GoodsForRepair/stz_pog:RepairAndTestingAddress">
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
										6. Реквизиты документов, подтверждающих передачу вывозимого товара лицу, которое будет непосредственно совершать Операции 
										по ремонту и техническим испытаниям в отношении вывозимого товара
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair/stz_pog:ConfirmTransferDoc">
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
										<xsl:apply-templates select="stz_pog:EntryGoodsTerm" mode="russian_date"/>
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
										<xsl:apply-templates select="stz_pog:CustomsPerson/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_pog:CustomsPerson/*[contains(local-name(), 'ame')]">
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
				<xsl:if test="stz_pog:OrderKind = 2 and stz_pog:DocKind = 2">
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
															наименование организации, содержащее указание на ее организацинно-правовую форму (сокращенное наименование, 
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
										<xsl:text>Разрешение</xsl:text><br/>
										<xsl:text>таможенного органа на совершение операций, предусмотренных подпунктом 5 пункта 4 статьи 205</xsl:text><br/>
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
													<td>Настоящее разрешение выдано</td>
													<td style="width: 210mm;">
														<table class="inlinetable" style="width: 100%;">
															<tbody>
																<tr align="center">
																	<td class="value" width="100%;">
																		<xsl:apply-templates select="stz_pog:Resident" mode="org"/>
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
										и свидетельствует о возможности вывоза с территории особой экономической зоны, с участка территории свободной экономической зоны 
										на территориях Республики Крым и города федерального значения Севастополя, на которых применяется таможенная процедура свободной 
										таможенной зоны, на остальную часть таможенной территории Евразийского экономического союза по заявлению № 
										<xsl:apply-templates select="stz_pog:AppRegNumber" mode="reg_num_simple"/> 
										товара, помещенного под таможенную процедуру свободной экономической зоны, и (или) товара, изготовленного (полученного) из товара, помещенного 
										под таможенную процедуру свободной таможенной зоны (далее - вывозимый товар), для целей совершения в отношении товара операций, предусмотренных 
										подпунктом 5 пункта 4 статьи 205 Таможеннго кодекса Евразийского экономического союза (далее - Операции по переработке)
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="paragraph">
										1. Лицо (лица), которое непосредственно будет совершать Операции по переработке за пределами 
										территории особой экономической зоны, участка территории свободной экономической зоны на территориях Республики Крым и города федерального значения 
										Севастополя, на которых применяется таможенная процедура свободной таможенной зоны
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:ProcessingPerson">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="org"/>
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
										2. Вывозимый товар с указанием наименований, классификационных кодов в соответствии с единой Товарной номенклатурой внешнеэкономической 
										деятельности Евразийского экономического союза (далее - ТН ВЭД ЕАЭС)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:PlacedGoods">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_pog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_pog:GoodsDescription"/>
											<xsl:text> </xsl:text>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										3. Получаемый товар с указанием наименований, классификационных кодов в соответствии с единой Товарной номенклатурой внешнеэкономической 
										деятельности Евразийского экономического союза (далее - ТН ВЭД ЕАЭС)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:GoodsResult">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_pog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_pog:GoodsDescription"/>
											<xsl:text> </xsl:text>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										4. Номер декларации (номера дерлараций) на товары, в соответствии с которой товар(часть, узел, агрегат товара)  был помещен 
										под таможенную процедуру свободной таможенной зоны, и номер товара в декларации (декларациях) на товары
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:GoodsAccountDoc[contains(cat_ru:PrDocumentName, 'NumDT')]">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:value-of select="substring(normalize-space(cat_ru:PrDocumentName), 6)"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date_gtd"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										5. Реквизиты документа бухгалтерского учета (наименование, дата, номер), согласно которому вывозимый товар отражен в бухгалтерском учете организации, 
										являющейся резидентом особой экономической зоны, или лица, которое в соответствии с Федеральным законом  от 29 ноября 2014 г. № 377-ФЗ "О развитии 
										Республики Крым и города федерального значения Севастополя и свободной экономической зоне на территориях Республики Крым и города федерального 
										значения Севастополя" имеет право помещать товар под таможенную процедуру свободно таможенной зоны и (или) использовать товар, помещенный 
										под таможенную процедуру свободной таможенной зоны (сведения указываются, если вывозится товар, изготовленный (полученный) из товара, помещенного 
										под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:GoodsAccountDoc[not(contains(cat_ru:PrDocumentName, 'NumDT'))]">
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
										6. Операции по переработке, которые являются составной частью производственного процесса и будут совершаться за пределами территории 
										особой экономической зоны, участка территории свободной экономической зоны на территориях Республики Крым и города федерального 
										значения Севастополя, на которых применяется таможенная процедура свободной таможенной зоны, а также технологии их совершения
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:ProcessingOperations">
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
										7. Место (места) (с указанием адреса) совершения Операций по переработке
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:ProcessingPlace">
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
										8. Реквизиты документов, на основании которых осуществляется передача вывозимого товара (реквизиты документоа (документов), подтверждающего 
										передачу вывозимого товара) лицу, которое будет непосредственно совершать Операции по переработке в отношении вывозимого товара
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:ConfirmTransferDoc">
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
										9. Срок ввоза получаемого товара или вывозимого товара, если Операции по переработке не совершались по объективным причинам 
										на участок территории свободной экономической зоны на территориях Республики Крым и города федерального значения Севастополя, 
										накоторых применяется таможенная процедура свободной таможенной зоны
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_pog:EntryGoodsTerm" mode="russian_date"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										9<sup>1</sup>. Срок совершения Операций по переработке
									</td>
								</tr>
								<tr>
									<td class="bordered">
										
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										10. Способы идентификации вывозимого товара в получаемом товаре
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_pog:GoodsForProcessing/stz_pog:MethodIdentify"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										11. Нормы расхода вывозимого товара на единицу получаемого товара или нормы выхода получаемого товара 
										с учетом использования товара Евразийского экономического союза
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_pog:GoodsForProcessing/stz_pog:YieldNorm"/>
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
										<xsl:apply-templates select="stz_pog:CustomsPerson/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_pog:CustomsPerson/*[contains(local-name(), 'ame')]">
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
				<xsl:if test="stz_pog:OrderKind = 3 and stz_pog:DocKind = 1">
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
														<span class="incline"></span>
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
										<xsl:text>Разрешение</xsl:text><br/>
										<xsl:text>таможенного органа на совершение операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205</xsl:text><br/>
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
													<td>Настоящее разрешение выдано</td>
													<td style="width: 210mm;">
														<table class="inlinetable" style="width: 100%;">
															<tbody>
																<tr align="center">
																	<td class="value" width="100%;">
																		<xsl:apply-templates select="stz_pog:Resident" mode="org"/>
																	</td>
																</tr>
																<tr align="center">
																	<td class="descr" width="100%">
																		(наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, 
																		если такое сокращенное наименование предусмотрено учредительным документом юридического лица), основной 
																		государственный регистрацинной номер (ОГРН), идентификационный номер налогоплательщика (ИНН) и код причины 
																		постановки на учет в налоговом органе (КПП), присвоенные юридическому лицу в соответствии с законодательством 
																		Российской Федерации, адрес в пределах места нахождения юридического лица - для юридического лица; 
																		фамилия, имя, отчетство (при наличии), место жительства или место пребывания физического лица, идентификационный 
																		номер налогоплательщика (ИНН), основной государственный регистрационный номер индивидуального предпринимателя 
																		(ОГРНИП) и сведения о документе, удостоверяющем личность физического лица - для физического лица (индивидуального 
																		предпринимателя)
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
										и свидетельствует о возможности вывоза с территории особой экономической зоны, с участка территории свободной экономической зоны, 
										на которой применяется процедура свободной таможенной зоны, на остальную часть таможенной территории Евразийского экономического союза 
										по заявлению № 
										<xsl:apply-templates select="stz_pog:AppRegNumber" mode="reg_num_simple"/> 
										для целей совершения в отношении товара операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205 Таможеннго кодекса Евразийского 
										экономического союза (далее - Операции по ремонту и техническим испытаниям)
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="paragraph">
										1. Лицо (лица), которое непосредственно будет совершать Операции по ремонту и техническим испытаниям за пределами 
										участка территории свободной экономической зоны, на которых применяется таможенная процедура свободной таможенной зоны
									</td>
								</tr>
								<tr>
									<td class="descr">
										(наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, 
										если такое сокращенное наименование предусмотрено учредительным документом юридического лица), основной 
										государственный регистрацинной номер (ОГРН), идентификационный номер налогоплательщика (ИНН) и код причины 
										постановки на учет в налоговом органе (КПП), присвоенные юридическому лицу в соответствии с законодательством 
										Российской Федерации, адрес в пределах места нахождения юридического лица - для юридического лица; 
										фамилия, имя, отчетство (при наличии), место жительства или место пребывания физического лица, идентификационный 
										номер налогоплательщика (ИНН), основной государственный регистрационный номер индивидуального предпринимателя 
										(ОГРНИП) и сведения о документе, удостоверяющем личность физического лица - для физического лица (индивидуального 
										предпринимателя)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair/stz_pog:RepairAndTestingPerson">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="org"/>
										</xsl:for-each>
									</td>
								</tr>
								
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										2. Наименование товара и его характеристики
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair//*[local-name() = 'RepairGoodsInfo' or local-name() = 'TestingGoodsInfo']">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_pog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_pog:GoodsDescription"/>
											<xsl:text> </xsl:text>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										3. Номер декларации (номера дерлараций) на товары, в соответствии с которой товар(часть, узел, агрегат товара)  был помещен 
										под таможенную процедуру свободной таможенной зоны, и (или) товары (части, узлы, агрегаты товаров), изготовленные (полученные) 
										из товаров, помещенных под таможенную процедуру свободной таможенной зоны, и предназначенные для вывоза (далее - вывозиммые товары), 
										были помещены под таможенную процедуру свободной таможенной зоны, и номер товаров в декларации (декларациях) на товары 
										(сведения указываются, если вывозятся товары (части, узлы, агрегаты товаров), ранее помещенные под таможенную процедуру 
										свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair//*[local-name() = 'RepairGoodsInfo' or local-name() = 'TestingGoodsInfo']/stz_pog:AccountDoc[contains(cat_ru:PrDocumentName, 'NumDT')]">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:value-of select="substring(normalize-space(cat_ru:PrDocumentName), 6)"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date_gtd"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										4. Реквизиты документа бухгалтерского учета (наименование, дата, номер), согласно которому товар, изготовленный (полученный) из товара, 
										помещенного под таможенную процедуру свободной таможенной зоны, отражен в бухгалтерском учете участника (сведения 
										указываются, если вывозится товар, изготовленный (полученный) из товара, помещенного под таможенную процедуру свободной таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair//*[local-name() = 'RepairGoodsInfo' or local-name() = 'TestingGoodsInfo']/stz_pog:AccountDoc[not(contains(cat_ru:PrDocumentName, 'NumDT'))]">
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
										5. Цель вывоза и место (места) (с указанием адреса) совершения Операций по ремонту и техническим испытаниям
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_pog:GoodsForRepair/stz_pog:RepairAndTestingOperations"/>
										<br/>
										<xsl:for-each select="stz_pog:GoodsForRepair/stz_pog:RepairAndTestingAddress">
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
										6. Реквизиты документов, подтверждающих передачу вывозимого товара лицу, которое будет непосредственно совершать Операции 
										по ремонту и техническим испытаниям в отношении вывозимого товара
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForRepair/stz_pog:ConfirmTransferDoc">
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
										<xsl:apply-templates select="stz_pog:EntryGoodsTerm" mode="russian_date"/>
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
										<xsl:apply-templates select="stz_pog:CustomsPerson/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_pog:CustomsPerson/*[contains(local-name(), 'ame')]">
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
				<xsl:if test="stz_pog:OrderKind = 3 and stz_pog:DocKind = 2">
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
														<span class="incline"></span>
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
										<xsl:text>Разрешение</xsl:text><br/>
										<xsl:text>таможенного органа на совершение операций, предусмотренных подпунктом 5 пункта 4 статьи 205</xsl:text><br/>
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
													<td>Настоящее разрешение выдано</td>
													<td style="width: 210mm;">
														<table class="inlinetable" style="width: 100%;">
															<tbody>
																<tr align="center">
																	<td class="value" width="100%;">
																		<xsl:apply-templates select="stz_pog:Resident" mode="org"/>
																	</td>
																</tr>
																<tr align="center">
																	<td class="descr" width="100%">
																		(наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, 
																		если такое сокращенное наименование предусмотрено учредительным документом юридического лица), основной 
																		государственный регистрацинной номер (ОГРН), идентификационный номер налогоплательщика (ИНН) и код причины 
																		постановки на учет в налоговом органе (КПП), присвоенные юридическому лицу в соответствии с законодательством 
																		Российской Федерации, адрес в пределах места нахождения юридического лица - для юридического лица; 
																		фамилия, имя, отчетство (при наличии), место жительства или место пребывания физического лица, идентификационный 
																		номер налогоплательщика (ИНН), основной государственный регистрационный номер индивидуального предпринимателя 
																		(ОГРНИП) и сведения о документе, удостоверяющем личность физического лица - для физического лица (индивидуального 
																		предпринимателя)
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
										и свидетельствует о возможности вывоза с участка территории особой экономической зоны,  на которых применяется таможенная процедура свободной 
										таможенной зоны, на остальную часть таможенной территории Евразийского экономического союза по заявлению № 
										<xsl:apply-templates select="stz_pog:AppRegNumber" mode="reg_num_simple"/> 
										(далее - вывозимые товары), для целей совершения в отношении товаров операций, предусмотренных 
										подпунктом 5 пункта 4 статьи 205 Таможеннго кодекса Евразийского экономического союза (далее - Операции по переработке)
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="paragraph">
										1. Лицо (лица), которое непосредственно будет совершать Операции по переработке за пределами 
										территории особой экономической зоны, участка территории свободной экономической зоны на территориях Республики Крым и города федерального значения 
										Севастополя, на которых применяется таможенная процедура свободной таможенной зоны
									</td>
								</tr>
								<tr>
									<td class="descr">
										(наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, 
										если такое сокращенное наименование предусмотрено учредительным документом юридического лица), основной 
										государственный регистрацинной номер (ОГРН), идентификационный номер налогоплательщика (ИНН) и код причины 
										постановки на учет в налоговом органе (КПП), присвоенные юридическому лицу в соответствии с законодательством 
										Российской Федерации, адрес в пределах места нахождения юридического лица - для юридического лица; 
										фамилия, имя, отчетство (при наличии), место жительства или место пребывания физического лица, идентификационный 
										номер налогоплательщика (ИНН), основной государственный регистрационный номер индивидуального предпринимателя 
										(ОГРНИП) и сведения о документе, удостоверяющем личность физического лица - для физического лица (индивидуального 
										предпринимателя)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:ProcessingPerson">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="org"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										2. Вывозимые товары с указанием наименований, классификационных кодов в соответствии с единой Товарной номенклатурой 
										внешнеэкономической деятельности Евразийского экономического союза (далее - ТН ВЭД ЕАЭС), количества в основных и 
										дополнительных единицах измерения в соответствии с ТН ВЭД ЕАЭС
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:PlacedGoods">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_pog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_pog:GoodsDescription"/>
											<xsl:text> </xsl:text>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										3. Получаемые товары с указанием наименований, классификационных кодов в соответствии с ТН ВЭД ЕАЭС, количество в основных или дополнительных 
										единицах измерения в соответствии с ТН ВЭД ЕАЭС
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:GoodsResult">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="stz_pog:Position"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="stz_pog:GoodsDescription"/>
											<xsl:text> </xsl:text>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										4. Номер декларации (номера дерлараций) на товары, в соответствии с которой (которыми) вывозимые товары  были помещены 
										под таможенную процедуру свободной таможенной зоны, и номер товара в декларации (декларациях) на товары
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:GoodsAccountDoc[contains(cat_ru:PrDocumentName, 'NumDT')]">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:value-of select="substring(normalize-space(cat_ru:PrDocumentName), 6)"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date_gtd"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										5. Реквизиты документа бухгалтерского учета (наименование, дата, номер), согласно которому вывозимые товары, изготовленные 
										(полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, отражены в бухгалтерском учете лицом, 
										которое в соответствии с Федеральным законом от 24 июня 2023 г. № 266-ФЗ "О свободной экономической зоне на территориях Донецкой 
										Народной Республики, Луганской Народной Республики, Запорожской области и Херсонской области" имеет право помещать товары под 
										таможенную процедуру свободной таможенной зоны и (или) использовать товары, помещенные под таможенную процедуру свободной 
										таможенной зоны)
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:GoodsAccountDoc[not(contains(cat_ru:PrDocumentName, 'NumDT'))]">
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
										6. Операции по переработке, которые являются составной частью производственного процесса и будут совершаться за пределами участка 
										территории особой экономической зоны, на котором применяется таможенная процедура свободной таможенной зоны
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:ProcessingOperations">
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
										7. Место (места) (с указанием адреса) совершения Операций по переработке
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:ProcessingPlace">
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
										8. Реквизиты документов, подтверждающих передачу вывозимых товаров лицу (лицам), которое будет непосредственно совершать 
										Операции по переработке в отношении вывозимых товаров
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="stz_pog:GoodsForProcessing/stz_pog:ConfirmTransferDoc">
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
										9. Срок ввоза получаемыых товаров (или вывозимых товаров, если Операции по переработке не совершались по объективным причинам) 
										на участок территории свободной экономической зоны, на которой применяется таможенная процедура свободной таможенной зоны
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_pog:EntryGoodsTerm" mode="russian_date"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										10. Способы идентификации вывозимых товаров в получаемых товарах
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_pog:GoodsForProcessing/stz_pog:MethodIdentify"/>
									</td>
								</tr>
								<tr>
									<td><br/><br/></td>
								</tr>
								<tr>
									<td class="paragraph">
										11. Нормы расхода вывозимых товаров на единицу получаемых товаров или нормы выхода получаемых товаров 
										с учетом использования товаров Евразийского экономического союза
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="stz_pog:GoodsForProcessing/stz_pog:YieldNorm"/>
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
										<xsl:apply-templates select="stz_pog:CustomsPerson/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;">
										<xsl:for-each select="stz_pog:CustomsPerson/*[contains(local-name(), 'ame')]">
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
	
	<xsl:template match="stz_pog:ProcessingOperations">
		<xsl:for-each select="stz_pog:Position">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="stz_pog:Operation"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="stz_pog:TechnologicalProcess"/>
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
		<!--xsl:choose>
			<xsl:when test="$STZ_NotifReg">
				<xsl:apply-templates select="$STZ_NotifReg/*[local-name() = 'RegistrationNumber']" mode="reg_num"/>
			</xsl:when>
			<xsl:otherwise-->
				<xsl:apply-templates select="stz_pog:PermitRegNumber" mode="reg_num"/>
			<!--/xsl:otherwise>
		</xsl:choose-->
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
	<xsl:template match="//*[local-name()='STZ_PermitOperationsGoods']//*" priority="-1">
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
