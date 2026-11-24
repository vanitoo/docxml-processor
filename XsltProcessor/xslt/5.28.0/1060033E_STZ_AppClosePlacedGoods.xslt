<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС от 02.10.2023 г. N 882 "Об утверждении формы заявления о завершении действия таможенной процедуры свободной таможенной зоны в отношении товаров, помещенных под таможенную процедуру свободной таможенной зоны, и признании таких товаров товарами Евразийского экономического союза в случаях, установленных пунктами 12 и 13 статьи 207 Таможенного кодекса Евразийского экономического союза, и формы решения таможенного органа о завершении действия такой таможенной процедуры и признании таких товаров товарами Евразийского экономического союза". Приложение №1 (acpg:DocKind = 1)-->
<!--Приказ ФТС России от 28.06.2023 г. N 553 "Об утверждении форм заявления и решения о завершении действия таможенной процедуры свободной таможенной зоны в отношении товаров, помещенных под таможенную процедуру свободной таможенной зоны, в случаях, предусмотренных частями 50 и 51 статьи 20 Федерального закона от 24.06.2023 N 266-ФЗ "О свободной экономической зоне на территориях Донецкой Народной Республики, Луганской Народной Республики, Запорожской области и Херсонской области". Приложение №1 (acpg:DocKind = 2)-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:acpg="urn:customs.ru:Information:ExchangeDocuments:STZ_AppClosePlacedGoods:5.28.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0">
	
	<xsl:variable name="DocKind" select="acpg:STZ_AppClosePlacedGoods/acpg:DocKind"/>
	
	<xsl:template match="acpg:STZ_AppClosePlacedGoods">
		<xsl:param name="w" select="277"/>
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
                  .font10{
					  font-size: 8pt;
                  }
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr valign="top">
								<td width="49%">
									Отметка таможенного органа
									<table>
										<tbody>
											<tr valign="top">
												<td class="bordered">
													<xsl:text>Регистрационный № </xsl:text>
													<table>
														<tbody>
															<tr>
																<td align="center">
																	<table style="display: inline-block; width: 25mm;">
																		<tbody>
																			<tr>
																				<td><br/></td>
																			</tr>
																			<tr align="center" valign="top">
																				<td style="font-size: 8pt; border-top: 1px solid black;">
																					<xsl:text>(код таможенного органа)</xsl:text>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</td>
																<td align="center" valign="top">
																	<xsl:text>/</xsl:text>
																</td>
																<td align="center">
																	<table style="display: inline-block; width: 25mm;">
																		<tbody>
																			<tr>
																				<td><br/></td>
																			</tr>
																			<tr align="center" valign="top">
																				<td style="font-size: 8pt; border-top: 1px solid black;">
																					<xsl:text>(день, месяц, год)</xsl:text>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</td>
																<td align="center" valign="top">
																	<xsl:text>/</xsl:text>
																</td>
																<td align="center">
																	<table style="display: inline-block; width: 25mm;">
																		<tbody>
																			<tr>
																				<td><br/></td>
																			</tr>
																			<tr align="center" valign="top">
																				<td style="font-size: 8pt; border-top: 1px solid black;">
																					<xsl:text>(порядковый номер)</xsl:text>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</td>
																<td align="center" valign="top">
																	<xsl:text>/</xsl:text>
																</td>
																<td align="center" valign="top">
																	<xsl:text>ЗЗПО</xsl:text>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="2%"></td>
								<td width="49%">
									<table>
										<tbody>
											<tr>
												<td>
													<xsl:text>В </xsl:text>
													<xsl:apply-templates select="acpg:Customs"/>
												</td>
											</tr>
											<tr>
												<td align="center" valign="top" style="font-size: 8pt; border-top: 1px solid black;">
													(наименование таможенного органа (с указанием кода таможенного органа)
												</td>
											</tr>
											<tr>
												<td>
													<xsl:text>От </xsl:text>
													<xsl:apply-templates select="acpg:Resident"/>
												</td>
											</tr>
											<tr>
												<td align="justify" valign="top" style="font-size: 8pt; border-top: 1px solid black;">
													<xsl:choose>
														<xsl:when test="$DocKind = 1">
															(резидент особой экономической зоны (территории опережающего развития, свободного порта Владивосток, Арктической зоны Российской Федерации) или участник свободной (особой) экономической зоны (далее - Заявитель) 
															(наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое наименование предусмотрено учредительным документом юридического лица), 
															основной государственный регистрационнй номер (ОГРН), идентификационный номер налогоплательщика (ИНН) и код причины постановки на учет в налоговом органе (КПП), присвоенные юридическому лицу 
															в соответствии с законодательством Российской Федерации, адрес юридического лица в пределах его места нахождения - для юридического лица; фамилия, имя, отчество (при наличии), адрес регистрации по месту жительства 
															или по месту пребывания филического лица, идентификационный номер налогоплательщика (ИНН), основной государственный регистрацинной номер индивидуального предпринимателя (ОГРНИП) и сведения о документе, 
															удостоверяющем личность физического лица - для физического лица; реквизиты свидетельства о включении в реестр резидентов особой экономической зоны (свободного порта Владивосток, Арктической зоны Российской Федерации) 
															или удостоверяющего регистрацию лица в качестве резидента территории опережающего развития, или о включении в единый реестр участников свободной экономической зоны, или регистрационного свидетельсва, подтверждающего 
															получение статуса участника Особой экономической зоны в Магаданской области и на территориях Южно-Курильского, Курильского и Северо-Курильского городских округов Сахалинской области)
														</xsl:when>
														<xsl:when test="$DocKind = 2">
															(участник свободной экономической зоны (далее - Заявитель) (наименование организации, идентификационный номер налогоплательщика (ИНН) и код причины поставновки на учет в налоговом органе (КПП), присвоенные юридическому лицу 
															в соответствии с законодательством Российской Федерации - для юридического лица; фамилия, имя, отчество (при наличии), идентификационный номер налогоплательщика (ИНН) - для физического лица)
														</xsl:when>
													</xsl:choose>
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
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<xsl:text>Заявление</xsl:text><br/>
										<xsl:choose>
											<xsl:when test="$DocKind = 1">
												о завершении действия таможенной процедуры свободной таможенной зоны<br/>
												в отношении товаров, помещенных под таможенную процедуру свободной таможенной зоны,<br/>
												и признании таких товаров товарами Евразийского экономического союза в случаях,<br/>
												установленных пунктами 12 и 13 статьи 207 Таможенного кодекса<br/>
												Евразийского экономического союза
											</xsl:when>
											<xsl:when test="$DocKind = 2">
												о завершении действия таможенной процедуры свободной таможенной зоны<br/>
												в отношении товаров, помещенных под таможенную процедуру свободной таможенной зоны,<br/>
												в случаях, предусмотренных частями 50 и 51 статьи 20 Федерального закона от 24.06.2023 № 266-ФЗ<br/>
												"О свободной экономической зоне на территориях Донецкой Народной Республики, Луганской Народной Республики,<br/>
												Запорожской области и Херсонской области
											</xsl:when>
										</xsl:choose>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<p style="text-indent: 5mm;">
						<xsl:text>Прошу завершить действие таможенной процедуры свободной таможенной зоны на основании пункта </xsl:text>
						<xsl:apply-templates select="acpg:LowArticle"/>
						<xsl:text> статьи 207 Таможенного кодекса Евразийского экономического союза</xsl:text><sup>1</sup>
						<xsl:text> в отношении товаров согласно представленным ниже сведениям на </xsl:text>
						<span style="display: inline-block; width: 15mm; border-bottom: 1px solid black; text-align: center;">
							<xsl:apply-templates select="acpg:SheetsNumber"/>
						</span>
						<xsl:text> л. для приобретения такими товарами статуса товаров Евразийского экономического союза.</xsl:text>
					</p>
					<p style="text-indent: 5mm;">
						<xsl:text>1. </xsl:text>
						<xsl:choose>
							<xsl:when test="$DocKind = 1">
								<xsl:text>Сведения о документе, свидетельствующем о выполнении условий соглашения об осуществлении (ведении) (инвестиционной) деятельности или инвестиционной деятельности, или сведения о нормативном правовом акте, которым определено прекращение применения таможенной процедуры свободной таможенной зоны в особой (свободной) экономической зоне, на территориях опережающего развития, свободного порта Владивосток, Арктической зоны Российской Федерации</xsl:text>
							</xsl:when>
							<xsl:when test="$DocKind = 2">
								<xsl:text>Сведения о документе, свидетельствующем о выполнении условий договора об условиях деятельности в свободной экономической зоне, или сведения о нормативном правовом акте, которым определено прекращение применения таможенной процедуры свободной таможенной зоны на территории свободной экономической зоны</xsl:text>
							</xsl:when>
						</xsl:choose>
						<table width="100%">
							<tbody>
								<tr>
									<td>
										<xsl:apply-templates select="acpg:AgreementDoc" mode="full_doc"/>
										<xsl:apply-templates select="acpg:LegalAct" mode="full_doc"/>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size: 8pt; border-top: 1px solid black;">(наименование, номер, дата)</td>
								</tr>
							</tbody>
						</table>
					</p>
					<p style="text-indent: 5mm;">
						<xsl:text>2. Сведения о товарах, помещенных под таможенную процедуру свободной таможенной зоны, в отношении которых действие таможенной процедуры свободной таможенной зоны завершается.</xsl:text>
					</p>
					<br/>
					<br/>
					<div style="text-align: center;">
						<xsl:text>Таблица 1. </xsl:text>
						<xsl:choose>
							<xsl:when test="$DocKind = 1">
								<xsl:text>Оборудование, помещенное под таможенную процедуру свободной таможенной зоны, введенное в эксплуатацию и используемое Заявителем для реализации соглашения об осуществлении (ведении) (инвестиционной) деятельности или инвестиционной деятельности</xsl:text>
							</xsl:when>
							<xsl:when test="$DocKind = 2">
								<xsl:text>Оборудование, помещенное под таможенную процедуру свободной таможенной зоны, введенное в эксплуатацию и используемое Заявителем для реализации договора об условиях деятельности в свободной экономической зоне</xsl:text>
							</xsl:when>
						</xsl:choose>
					</div>
					<table style="margin: 0; table-layout: fixed; width: 100%;">
						<tbody>
							<tr align="center" valign="top">
								<td width="5%"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td width="5%"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered font10" colspan="5">Оборудование (машины, агрегаты), помещенное под таможенную процедуру свободной таможенной зоны</td>
								<td class="bordered font10" colspan="6">Товары, помещенные под таможенную процедуру свободной таможенной зоны</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered font10">№ п/п</td>
								<td class="bordered font10">Наименование оборудования</td>
								<td class="bordered font10">Вид (класс) оборудования в соответствии со стандартами, техническими условиями</td>
								<td class="bordered font10">Сведения о постановке оборудования на баланс Заявителем</td>
								<td class="bordered font10">Сведения о документе, свидетельствующем о вводе оборудования в эксплуатацию</td>
								<td class="bordered font10">№ п/п</td>
								<td class="bordered font10">Наименование товара</td>
								<td class="bordered font10">Регистрационный номер декларации на товары</td>
								<td class="bordered font10">Номер товара</td>
								<td class="bordered font10">Количество / единица измерения</td>
								<td class="bordered font10">Примечание (при наличии)</td>
							</tr>
							<xsl:for-each select="acpg:Equipment">
								<xsl:variable name="rowspan">
									<xsl:choose>
										<xsl:when test="count(acpg:EquipmentGoods) &gt; 0">
											<xsl:value-of select="count(acpg:EquipmentGoods)"/>
										</xsl:when>
										<xsl:otherwise>1</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr valign="top">
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="acpg:Position"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="acpg:EquipmentName"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="acpg:EquipmentKind"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="acpg:AccountDoc" mode="full_doc"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:for-each select="acpg:CommissioningDetails">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="full_doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="acpg:EquipmentGoods[1]/acpg:Position"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="acpg:EquipmentGoods[1]/acpg:GoodsDescription"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="acpg:EquipmentGoods[1]/acpg:PropertyGoodsDecl">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="acpg:DeclRegNum" mode="reg_num"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="acpg:EquipmentGoods[1]/acpg:PropertyGoodsDecl">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:for-each select="acpg:GoodsDeclnfo/acpg:GoodsNumber">
												<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="acpg:EquipmentGoods[1]/acpg:PropertyGoodsDecl">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:for-each select="acpg:GoodsDeclnfo/acpg:GoodsQuantity">
												<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="acpg:EquipmentGoods[1]">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="acpg:Comment"/>
										</xsl:for-each>
									</td>
								</tr>
								<xsl:for-each select="acpg:EquipmentGoods[position() &gt; 1]">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="acpg:Position"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="acpg:GoodsDescription"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="acpg:PropertyGoodsDecl">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="acpg:DeclRegNum" mode="reg_num"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="acpg:PropertyGoodsDecl">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:for-each select="acpg:GoodsDeclnfo/acpg:GoodsNumber">
													<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="acpg:PropertyGoodsDecl">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:for-each select="acpg:GoodsDeclnfo/acpg:GoodsQuantity">
													<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="acpg:Comment"/>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<div style="text-align: center;">
						<xsl:text>Таблица 2. </xsl:text>
						<xsl:text>Товары, помещенные под таможенную процедуру свободной таможенной зоны, использованные для создания объектов недвижимости на территории свободной экономической зоны и являющеся составной  (неотъемлемой) частью таких объектов недвижимости</xsl:text>
					</div>
					<xsl:for-each select="acpg:Property">
						<xsl:if test="position() != 1"><br/></xsl:if>
						<table style="margin: 0; table-layout: fixed; width: 100%;">
							<tbody>
								<tr align="center">
									<td class="bordered font10" colspan="6">I. Объект недвижимости <xsl:apply-templates select="acpg:PropertyObject/acpg:Position"/></td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10">Наименование объекта недвижимости</td>
									<td class="bordered font10">Место нахождения объекта недвижимости (адрес)</td>
									<td class="bordered font10">Сведения о технической документации</td>
									<td class="bordered font10">Сведения о постановке объекта недвижимости на баланс Заявителя и дате ввода его в эксплуатацию</td>
									<td class="bordered font10">Сведения о внесении записи о праве собственности Заявителя на объект недвижимости в Единый государственный реестр недвижимости</td>
									<td class="bordered font10">Примечание (при наличии)</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10">1</td>
									<td class="bordered font10">2</td>
									<td class="bordered font10">3</td>
									<td class="bordered font10">4</td>
									<td class="bordered font10">5</td>
									<td class="bordered font10">6</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10">
										<xsl:apply-templates select="acpg:Property/acpg:PropertyObject/acpg:PropertyName"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="acpg:PropertyObject/acpg:PropertyLocation" mode="address"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="acpg:PropertyObject/acpg:TechDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="full_doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="acpg:PropertyObject/acpg:BalanceSheet" mode="full_doc"/>
										<xsl:text>, </xsl:text>
										<xsl:apply-templates select="acpg:PropertyObject/acpg:CommissioningDate" mode="russian_date"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="acpg:PropertyObject/acpg:OwnershipDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="full_doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="acpg:PropertyObject/acpg:Comment"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table style="margin: 0; table-layout: fixed; width: 100%;">
							<tbody>
								<tr align="center">
									<td class="bordered font10" style="border-top: 0px;" colspan="8">
										II. Товары, помещенные под таможенную процедуру свободной таможенной зоны и потребленные при создании объекта недвижимости
									</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10">№ п/п</td>
									<td class="bordered font10">Наименование товара / Код товара</td>
									<td class="bordered font10">Регистрационный номер декларации на товары</td>
									<td class="bordered font10">Номер товара в основной единице измерения / кг</td>
									<td class="bordered font10">Количество товара в основной единице измерения / кг</td>
									<td class="bordered font10">Количество товара/ дополнительная единица измерения количества</td>
									<td class="bordered font10">Наименование составной (неотемлемой) части, при создании которой был потреблен товар</td>
									<td class="bordered font10">Сведения о документах бухгалтерского учета</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10">1</td>
									<td class="bordered font10">2</td>
									<td class="bordered font10">3</td>
									<td class="bordered font10">4</td>
									<td class="bordered font10">5</td>
									<td class="bordered font10">6</td>
									<td class="bordered font10">7</td>
									<td class="bordered font10">8</td>
								</tr>
								<xsl:for-each select="acpg:ConsumedGoods">
									<tr valign="top">
									<td class="bordered font10">
										<xsl:apply-templates select="acpg:Position"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="acpg:GoodsDescription"/>
										<xsl:if test="acpg:GoodsTNVEDCode">
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="acpg:GoodsTNVEDCode"/>
										</xsl:if>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="acpg:GoodsDecl">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="acpg:DeclRegNum" mode="reg_num"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="acpg:GoodsDecl">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:for-each select="acpg:GoodsDeclnfo/acpg:GoodsNumber">
												<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="acpg:GoodsWeightQuantity"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="acpg:GoodsQuantity">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="quantity"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="acpg:ComponentUseName"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="acpg:AccountDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="full_doc"/>
										</xsl:for-each>
									</td>
								</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<xsl:for-each select="acpg:ManufacturedGoods">
							<table style="margin: 0; table-layout: fixed; width: 100%;">
								<tbody>
									<tr align="center">
										<td class="bordered font10" style="border-top: 0px;" colspan="7">
											III. Товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны и потребленные при создании объекта недвижимости
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10">№ п/п</td>
										<td class="bordered font10">Наименование товара</td>
										<td class="bordered font10">Классификационный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза</td>
										<td class="bordered font10">Количество потребленного товара/ единица измерения количества</td>
										<td class="bordered font10">Сведения об операциях по переработке</td>
										<td class="bordered font10">Наименование составной (неотъемлемой) части объекта недвижимости, при создании которой был потреблен товар</td>
										<td class="bordered font10">Сведения о документах бухгалтерского учета</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="acpg:Position"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="acpg:GoodsDescription"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="acpg:GoodsTNVEDCode"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="acpg:GoodsQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="acpg:ProcessingOperations"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="acpg:ComponentUseName"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="acpg:AccountDoc">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="full_doc"/>
											</xsl:for-each>
										</td>
									</tr>
								</tbody>
							</table>
							<table style="margin: 0; table-layout: fixed; width: 100%;">
								<tbody>
									<tr align="center">
										<td class="bordered font10" style="border-top: 0px;" colspan="6">
											IV. Товары, помещенные под таможенную процедуру свободной таможенной зоны и использованные при изготовлении товара, указанного в графе 2 раздела III настоящей таблицы
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10">№ п/п</td>
										<td class="bordered font10">Наименование товара</td>
										<td class="bordered font10">Регистрационный номер декларации на товары</td>
										<td class="bordered font10">Номер товара</td>
										<td class="bordered font10">Количество товара, использованного при изготовлении (получении) товара, в основной единице измерения</td>
										<td class="bordered font10">Количество товара, использованного при изготовлении (получении) товара / дополнительная единица измерения количества</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
									</tr>
									<xsl:for-each select="acpg:UsedManufacturedGoods">
										<tr valign="top">
											<td class="bordered font10">
												<xsl:apply-templates select="acpg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="acpg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="acpg:GoodsDecl">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="acpg:DeclRegNum" mode="reg_num"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="acpg:GoodsDecl">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:for-each select="acpg:GoodsDeclnfo/acpg:GoodsNumber">
														<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="acpg:GoodsWeightQuantity"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="acpg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:for-each>
					</xsl:for-each>
					<br/>
					<br/>
					<div style="text-align: center;">
						<xsl:text>Таблица 3. </xsl:text>
						<xsl:text>Товары, помещенные под таможенную процедуру свободной таможенной зоны, являющиеся имуществом дополнительно установленным, смонтированном на объекте недвижимости, сведения о котором указаны в Таблице 2 настоящего приложения, в ходе капитальных вложений</xsl:text>
					</div>
					<table style="margin: 0; table-layout: fixed; width: 100%;">
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered font10">№ п/п</td>
								<td class="bordered font10">Наименование товара</td>
								<td class="bordered font10">Регистрационный номер декларации на товары</td>
								<td class="bordered font10">Номер товара</td>
								<td class="bordered font10">Количество товара / единица измерения</td>
								<td class="bordered font10">Наименование составной (неотъемлемой) части объекта недвижимости, где дополнительно установлен, смонтирован товар</td>
								<td class="bordered font10">Сведения о сдаче-приемке работ по установке дополнительно установленного, смонтированного имущества</td>
								<td class="bordered font10">Документы бухгалтерского учета заявителя, свидетельствующие о проведенных работах по установке и монтажу товара</td>
								<td class="bordered font10">Примечание (при наличии)</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered font10">1</td>
								<td class="bordered font10">2</td>
								<td class="bordered font10">3</td>
								<td class="bordered font10">4</td>
								<td class="bordered font10">5</td>
								<td class="bordered font10">6</td>
								<td class="bordered font10">7</td>
								<td class="bordered font10">8</td>
								<td class="bordered font10">9</td>
							</tr>
							<xsl:for-each select="acpg:AddInstaled">
								<tr valign="top">
								<td class="bordered font10">
									<xsl:apply-templates select="acpg:Position"/>
								</td>
								<td class="bordered font10">
									<xsl:apply-templates select="acpg:GoodsDescription"/>
								</td>
								<td class="bordered font10">
									<xsl:for-each select="acpg:GoodsDecl">
										<xsl:if test="position() !=1"><br/></xsl:if>
										<xsl:apply-templates select="acpg:DeclRegNum" mode="reg_num"/>
									</xsl:for-each>
								</td>
								<td class="bordered font10">
									<xsl:for-each select="acpg:GoodsDecl">
										<xsl:if test="position() !=1"><br/></xsl:if>
										<xsl:for-each select="acpg:GoodsDeclnfo/acpg:GoodsNumber">
											<xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</xsl:for-each>
								</td>
								<td class="bordered font10">
									<xsl:for-each select="acpg:GoodsQuantity">
										<xsl:if test="position() != 1"><br/></xsl:if>
										<xsl:apply-templates select="." mode="quantity"/>
									</xsl:for-each>
								</td>
								<td class="bordered font10">
									<xsl:apply-templates select="acpg:ComponentName"/>
								</td>
								<td class="bordered font10">
									<xsl:for-each select="acpg:AcceptanceWork">
										<xsl:if test="position() != 1"><br/></xsl:if>
										<xsl:apply-templates select="." mode="full_doc"/>
									</xsl:for-each>
								</td>
								<td class="bordered font10">
									<xsl:for-each select="acpg:AccountWorkDoc">
										<xsl:if test="position() != 1"><br/></xsl:if>
										<xsl:apply-templates select="." mode="full_doc"/>
									</xsl:for-each>
								</td>
								<td class="bordered font10">
									<xsl:apply-templates select="acpg:Comment"/>
								</td>
							</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<p style="text-indent: 5mm;">
						<xsl:text>3. Опись представленных документов</xsl:text>
					</p>
					<table style="margin: 0; table-layout: fixed; width: 170mm;">
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered font10">№ п/п</td>
								<td class="bordered font10">Наименование документа</td>
								<td class="bordered font10">Реквизиты документа</td>
								<td class="bordered font10">Количество листов</td>
							</tr>
							<xsl:for-each select="acpg:PresentedDoc">
								<tr>
									<td class="bordered font10">
										<xsl:apply-templates select="acpg:Position"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="cat_ru:PrDocumentName"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="." mode="doc"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="acpg:SheetsNumber"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<table style="table-layout: fixed; width: 250mm;">
						<tbody>
							<tr valign="bottom">
								<td align="center" width="40%">
									<xsl:if test="acpg:ResidentSignature/cat_ru:PersonPost">
										<xsl:apply-templates select="acpg:ResidentSignature/cat_ru:PersonPost"/>
										<br/>
									</xsl:if>
									<xsl:apply-templates select="acpg:ConfirmDoc" mode="full_doc"/>
								</td>
								<td width="5%"></td>
								<td width="20%">
									
								</td>
								<td width="5%"></td>
								<td align="center" width="30%">
									<xsl:apply-templates select="acpg:ResidentSignature/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="acpg:ResidentSignature/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="acpg:ResidentSignature/cat_ru:PersonMiddleName"/>
								</td>
							</tr>
							<tr align="center">
								<td style="font-size: 8pt; border-top: 1px solid black;">
									(представитель Заявителя (должность), документ, подтверждающий полномочия лица)
								</td>
								<td></td>
								<td style="font-size: 8pt; border-top: 1px solid black;">
									(подпись)
								</td>
								<td></td>
								<td style="font-size: 8pt; border-top: 1px solid black;">
									(фамилия, имя, отчество (при наличии)
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="full_doc">
		<xsl:apply-templates select="*[local-name() = 'AgreementSeries' or local-name() = 'PrDocumentName']"/>
		<xsl:text> </xsl:text>
		<xsl:if test="*[local-name() = 'AgreementNumber' or local-name() = 'PrDocumentNumber']">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AgreementNumber' or local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'AgreementDate' or local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AgreementDate' or local-name() = 'PrDocumentDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="acpg:Resident">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'PersonId' or local-name() = 'IdentityCard']">
				<!-- считаем, что это ФЛ -->
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName)">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails and $DocKind = 1">
					<xsl:text>, адрес(а): </xsl:text>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN and $DocKind = 1">
					<xsl:text>, ОГРНИП </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:IdentityCard and $DocKind = 1">
					<xsl:text>, </xsl:text>
					<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="identityCard"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<!-- ЮЛ -->
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName)">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN and $DocKind = 1">
					<xsl:text>, ОГРН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP and $DocKind = 1">
					<xsl:text>, КПП </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails and $DocKind = 1">
					<xsl:text>, адрес(а): </xsl:text>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="$DocKind = 1">
			<xsl:apply-templates select="acpg:ResidentCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="acpg:ResidentCertificate">
		<xsl:text>, свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="acpg:CertificateNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="acpg:CertificateDate" mode="russian_date"/>
	</xsl:template>
	<xsl:template match="*" mode="identityCard">
		<xsl:apply-templates select="*[local-name() = 'IdentityCardName']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardSeries']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardNumber']"/>
		<xsl:if test="*[local-name() = 'IdentityCardDate']">
			<xsl:text> выдан </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'IdentityCardDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:if test="position() != 1">; </xsl:if>
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
	
	
	<xsl:template match="acpg:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:Code"/>
	</xsl:template>
	
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/ </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/ </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
	</xsl:template>
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="doc">
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text>№ </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
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
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='STZ_AppClosePlacedGoods']//*" priority="-1">
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
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
				<xsl:with-param name="dateIn" select="."/>
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
