<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС от 02.10.2023 г. N 882 "Об утверждении формы заявления о завершении действия таможенной процедуры свободной таможенной зоны в отношении товаров, помещенных под таможенную процедуру свободной таможенной зоны, и признании таких товаров товарами Евразийского экономического союза в случаях, установленных пунктами 12 и 13 статьи 207 Таможенного кодекса Евразийского экономического союза, и формы решения таможенного органа о завершении действия такой таможенной процедуры и признании таких товаров товарами Евразийского экономического союза". Приложение №2 -->
<!--Приказ ФТС России от 28.06.2023 г. N 553 "Об утверждении форм заявления и решения о завершении действия таможенной процедуры свободной таможенной зоны в отношении товаров, помещенных под таможенную процедуру свободной таможенной зоны, в случаях, предусмотренных частями 50 и 51 статьи 20 Федерального закона от 24.06.2023 N 266-ФЗ "О свободной экономической зоне на территориях Донецкой Народной Республики, Луганской Народной Республики, Запорожской области и Херсонской области". Приложение №2 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:pcpg="urn:customs.ru:Information:ExchangeDocuments:STZ_PermitClosePlacedGoods:5.28.0">
	<!-- Шаблон для типа STZ_PermitClosePlacedGoodsType -->
	<xsl:template match="pcpg:STZ_PermitClosePlacedGoods">
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
					  font-size: 9pt;
                  }
                  p{
					  padding: 0;
					  margin: 0;
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
																<td align="center" valign="top">
																	<table style="display: inline-block; width: 25mm;">
																		<tbody>
																			<tr>
																				<td align="center">
																					<xsl:apply-templates select="pcpg:PermissionRegNumber/pcpg:CustomsCode"/>
																				</td>
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
																<td align="center" valign="top">
																	<table style="display: inline-block; width: 25mm;">
																		<tbody>
																			<tr>
																				<td align="center">
																					<xsl:apply-templates select="pcpg:PermissionRegNumber/pcpg:RegistrationDate" mode="num_date"/>
																				</td>
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
																<td align="center" valign="top">
																	<table style="display: inline-block; width: 25mm;">
																		<tbody>
																			<tr>
																				<td align="center">
																					<xsl:apply-templates select="pcpg:PermissionRegNumber/pcpg:Number"/>
																				</td>
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
																	<xsl:text>РЗПО</xsl:text>
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
													<!--xsl:text>От </xsl:text-->
													<xsl:apply-templates select="pcpg:AppCloseSTZ/pcpg:Resident"/>
												</td>
											</tr>
											<tr>
												<td align="justify" valign="top" style="font-size: 8pt; border-top: 1px solid black;">
													(резидент особой экономической зоны (свободного порта Владивосток, Арктической зоны Российской Федерации) или участник свободной (особой) 
													экономической зоны (далее - Заявитель) (наименование организации, содержащее указание на ее организацинно-правовую форму (сокращенное 
													наименование, если такое наименование предусмотрено учредительным документом юридического лица), основной государственный регистрационный номер 
													(ОГРН), идентификационный номер налогоплательщика (ИНН) и код причины постановки на учет в налоговом органе (КПП), 
													присвоенные юридическогому лицу в соответствии с законодательством Российской Федерациии, адрес юридического лица в пределах его 
													места нахождения - для юридического лица; фамили, имя, отчество (при наличии), адрес регистрации по месту жительства или по месте 
													пребывания физического лица, идентификационный номер налогоплательщика (ИНН), основной государственный регистрационный номер 
													индивидуального предпринимателя (ОГРНИП) и сведения о документе, удостоверяющем личность физического лица - для физического лица; 
													реквизиты свидетельства о включении в реестр резидентов особой экономической зоны (свободного порта Владивосток, Арктической зоны 
													Российской Федерации) или о включении в единый реестр участников свободной экономической зоны, или регистрационного свидетельства, 
													подтверждающего получение статуса участника Особой экономической зоны в Магаданской области и на территориях Южно-Курильского,
													Курильского и Северо-Курильского городских округов Сахалинской области)
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
										Решение<br/>
										таможенного органа о завершении действия таможенной процедуры<br/>
										свободной таможенной зоны в отношении товаров,<br/>
										помещенных под таможенную процедуру свободной таможенной зоны,<br/>
										и признании таких товаров товарами Евразийского экономического союза<br/>
										в случаях, установленных пунктами 12 и 13 статьи 207<br/>
										Таможенного кодекса Евразийского экономического союза
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<p style="text-indent: 5mm;">
						Настоящее решение свидетельствует о завершении таможенной процедуры свободной таможенной зоны в отношении товаров по заявлению № 
						<xsl:apply-templates select="pcpg:AppRegNum" mode="reg_num"/>.
					</p>
					<p style="text-indent: 5mm;">
						Товары, помещенные под таможенную процедуру свободной таможенной зоны, согласно нижеприведенным сведениям, приобретают статус товаров 
						Евразийского экономического союза на основании пункта <xsl:apply-templates select="pcpg:AppCloseSTZ/pcpg:LowArticle"/> статьи 207 
						Таможенного кодекск Евразийского экономического союза<sup>*</sup> и действие таможенной процедуры свободной таможенной процедуры в отношении 
						таких товаров завершено.
					</p>
					<br/>
					<br/>
					<p style="text-indent: 5mm;">
						Раздел 1. Оборудование, помещенное под таможенную процедуру свободной таможенной зоны, введенное в эксплуатацию и используемое резидентом (участником) 
						особой (свободной) экономической зоны (свободного порта Владивосток, Арктической зоны Российской Федерации) для реализации соглашения об осуществлении 
						(ведении) (инвестиционной) деятельности или инвестиционной декларации
					</p>
					<table style="table-layout: fixed; width: 100%">
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered font10" rowspan="2" width="5%">№ п/п</td>
								<td class="bordered font10" colspan="2">Оборудование</td>
								<td class="bordered font10" colspan="5">Товары, помещенные под таможенную процедуру свободной таможенной зоны</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered font10">наименование</td>
								<td class="bordered font10">вид (класс)</td>
								<td class="bordered font10">наименование товара</td>
								<td class="bordered font10">регистрационный номер декларации на товары</td>
								<td class="bordered font10">номер товара</td>
								<td class="bordered font10">количество / единица измерения</td>
								<td class="bordered font10">решение</td>
							</tr>
							<tr align="center">
								<td class="bordered font10">1</td>
								<td class="bordered font10">2</td>
								<td class="bordered font10">3</td>
								<td class="bordered font10">4</td>
								<td class="bordered font10">5</td>
								<td class="bordered font10">6</td>
								<td class="bordered font10">7</td>
								<td class="bordered font10">8</td>
							</tr>
							<xsl:for-each select="pcpg:AppCloseSTZ/pcpg:Equipment">
								<xsl:variable name="goods" select=".//*[local-name() = 'EquipmentGoodsDecl']"/>
								<xsl:variable name="rowspan">
									<xsl:choose>
										<xsl:when test="count($goods) != 0">
											<xsl:value-of select="count($goods)"/>
										</xsl:when>
										<xsl:otherwise>1</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr valign="top">
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pcpg:Position"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pcpg:EquipmentName"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pcpg:EquipmentKind"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goods[1]/../pcpg:GoodsDescription"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goods[1]/pcpg:DeclRegNum" mode="reg_num"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]/pcpg:GoodsDeclnfo/pcpg:GoodsNumber">
											<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]/pcpg:GoodsDeclnfo/pcpg:GoodsQuantity">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="quantity"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goods[1]/../pcpg:Decision"/>
										<xsl:if test="$goods[1]/../pcpg:RejectionReason">
											<br/>
											<xsl:apply-templates select="$goods[1]/../pcpg:RejectionReason"/>
										</xsl:if>
									</td>
								</tr>
								<xsl:for-each select="$goods[position() &gt; 1]">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="../pcpg:GoodsDescription"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="pcpg:DeclRegNum" mode="reg_num"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="pcpg:GoodsDeclnfo/pcpg:GoodsNumber">
												<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="pcpg:GoodsDeclnfo/pcpg:GoodsQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="../pcpg:Decision"/>
											<xsl:if test="../pcpg:RejectionReason">
												<br/>
												<xsl:apply-templates select="../pcpg:RejectionReason"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<p style="text-indent: 5mm;">
						Раздел 2. Товары, помещенные под таможенную процедуру свободной таможенной зоны, использованные для создания объектов недвижимости на территории 
						особой (свободной) экономической зоны (свободного порта Владивосток, Арктической зоны Российской Федерации) и являющихся составной 
						(неотъемлемой) частью таких объектов недвижимости
					</p>
					<table style="table-layout: fixed; width: 100%">
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered font10" rowspan="2" width="5%">№ п/п</td>
								<td class="bordered font10" colspan="2">Объект недвижимости</td>
								<td class="bordered font10" colspan="5">Товары, помещенные под таможенную процедуру свободной таможенной зоны</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered font10">наименование</td>
								<td class="bordered font10">местонахождение</td>
								<td class="bordered font10">наименование товара</td>
								<td class="bordered font10">регистрационный номер декларации на товары</td>
								<td class="bordered font10">номер товара</td>
								<td class="bordered font10">количество / единица измерения</td>
								<td class="bordered font10">решение</td>
							</tr>
							<tr align="center">
								<td class="bordered font10">1</td>
								<td class="bordered font10">2</td>
								<td class="bordered font10">3</td>
								<td class="bordered font10">4</td>
								<td class="bordered font10">5</td>
								<td class="bordered font10">6</td>
								<td class="bordered font10">7</td>
								<td class="bordered font10">8</td>
							</tr>
							<xsl:for-each select="pcpg:AppCloseSTZ/pcpg:Property">
								<xsl:variable name="goods" select="*[local-name() = 'ConsumedGoods' or local-name() = 'ManufacturedGoods']"/>
								<xsl:variable name="rowspan">
									<xsl:choose>
										<xsl:when test="count($goods) != 0">
											<xsl:value-of select="count($goods)"/>
										</xsl:when>
										<xsl:otherwise>1</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr valign="top">
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pcpg:PropertyObject/pcpg:Position"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pcpg:PropertyObject/pcpg:PropertyName"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pcpg:PropertyObject/pcpg:PropertyLocation" mode="address"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goods[1]/pcpg:GoodsDescription"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]//pcpg:DeclRegNum">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="reg_num"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]//pcpg:GoodsNumber">
											<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]/pcpg:GoodsQuantity|$goods[1]/pcpg:PropertyGoodsDecl/pcpg:GoodsDeclnfo/pcpg:GoodsQuantity">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="quantity"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goods[1]/pcpg:Decision"/>
										<xsl:if test="$goods[1]/pcpg:RejectionReason">
											<br/>
											<xsl:apply-templates select="$goods[1]/pcpg:RejectionReason"/>
										</xsl:if>
									</td>
								</tr>
								<xsl:for-each select="$goods[position() &gt; 1]">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="pcpg:GoodsDescription"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select=".//pcpg:DeclRegNum">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="reg_num"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select=".//pcpg:GoodsNumber">
												<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="pcpg:GoodsQuantity|pcpg:PropertyGoodsDecl/pcpg:GoodsDeclnfo/pcpg:GoodsQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="pcpg:Decision"/>
											<xsl:if test="pcpg:RejectionReason">
												<br/>
												<xsl:apply-templates select="pcpg:RejectionReason"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<p style="text-indent: 5mm;">
						Раздел 3. Товары, помещенные под таможенную процедуру свободной таможенной зоны, являющиеся имуществом дополнительно установленным, смонтированным на 
						объекте недвижимости, сведения о котором указаны в Разделе 2, в ходе капительных вложений
					</p>
					<table style="table-layout: fixed; width: 100%">
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered font10" width="5%">№ п/п</td>
								<td class="bordered font10">Наименование товара</td>
								<td class="bordered font10">Регистрационный номер декларации на товары</td>
								<td class="bordered font10">Номер товара</td>
								<td class="bordered font10">Количество /  единица измерения</td>
								<td class="bordered font10">Наименование составной(неотъемлемой части объекта недвижимости, где дополнительно установлен, смонтирован товар</td>
								<td class="bordered font10">Решение</td>
							</tr>
							<tr align="center">
								<td class="bordered font10">1</td>
								<td class="bordered font10">2</td>
								<td class="bordered font10">3</td>
								<td class="bordered font10">4</td>
								<td class="bordered font10">5</td>
								<td class="bordered font10">6</td>
								<td class="bordered font10">7</td>
							</tr>
							<xsl:for-each select="pcpg:AppCloseSTZ/pcpg:AddInstaled">
								<xsl:variable name="goods" select="pcpg:AddInstaledGoods/pcpg:GoodsDeclnfo"/>
								<xsl:variable name="rowspan">
									<xsl:choose>
										<xsl:when test="count($goods) != 0">
											<xsl:value-of select="count($goods)"/>
										</xsl:when>
										<xsl:otherwise>1</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr valign="top">
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pcpg:Position"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pcpg:GoodsDescription"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]/../pcpg:DeclRegNum">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="reg_num"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]/pcpg:GoodsNumber">
											<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]/pcpg:GoodsQuantity">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="quantity"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pcpg:ComponentName"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pcpg:Decision"/>
										<xsl:if test="pcpg:RejectionReason">
											<br/>
											<xsl:apply-templates select="pcpg:RejectionReason"/>
										</xsl:if>
									</td>
								</tr>
								<xsl:for-each select="$goods[position() &gt; 1]">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:for-each select="../pcpg:DeclRegNum">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="reg_num"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="pcpg:GoodsNumber">
												<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="pcpg:GoodsQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<table style="table-layout: fixed; width: 200mm;">
						<tbody>
							<tr valign="bottom">
								<td width="70%" align="center">
									<xsl:apply-templates select="pcpg:CustomsSignature/cat_ru:PersonPost"/>
									<xsl:text>, </xsl:text>
									<xsl:for-each select="pcpg:CustomsSignature/*[contains(local-name(), 'ame')]">
										<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
								<td width="5%"></td>
								<td width="25%"></td>
							</tr>
							<tr align="center" valign="top">
								<td style="font-size: 8pt; border-top: 1px solid black;">
									(должность, фамилия, имя, отчество (при наличии) должностного лица таможенного органа)
								</td>
								<td></td>
								<td style="font-size: 8pt; border-top: 1px solid black;">
									(подпись)
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="pcpg:Decision">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">
					<xsl:text>разрешено</xsl:text>
				</xsl:when>
				<xsl:when test=". = 2">
					<xsl:text>отказано</xsl:text>
				</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	
	
	<xsl:template match="pcpg:Resident">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'PersonId' or local-name() = 'IdentityCard']">
				<!-- считаем, что это ФЛ -->
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName)">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails">
					<xsl:text>, адрес(а): </xsl:text>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<xsl:text>, ОГРНИП </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:IdentityCard">
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
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<xsl:text>, ОГРН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
					<xsl:text>, КПП </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails">
					<xsl:text>, адрес(а): </xsl:text>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>; </xsl:text>
		<xsl:apply-templates select="pcpg:ResidentCertificate"/>
	</xsl:template>
	<xsl:template match="pcpg:ResidentCertificate">
		<xsl:text>, свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="pcpg:CertificateNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="pcpg:CertificateDate" mode="russian_date"/>
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
	
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber' or local-name() = 'Number']"/>
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
	<xsl:template match="//*[local-name()='STZ_PermitClosePlacedGoods']//*" priority="-1">
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
