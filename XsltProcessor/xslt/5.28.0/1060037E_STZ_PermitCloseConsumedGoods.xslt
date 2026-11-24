<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС от 04.09.2023 г. N 784 "Об утверждении формы заявления о завершении действия таможенной процедуры свободной таможенной зоны (за исключением случаев завершения действия такой процедуры на территориях Донецкой Народной Республики, Луганской Народной Республики, Запорожской области и Херсонской области) в отношении товаров, которые были израсходованы (потреблены) в соответствии с подпунктом 5 пункта 1 статьи 205 Таможенного кодекса Евразийского экономического союза, формы решения таможенного органа о завершении действия такой таможенной процедуры и приобретении товарами статуса товаров Евразийского экономического союза и порядков их заполнения". Приложение №3-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:pccg="urn:customs.ru:Information:ExchangeDocuments:STZ_PermitCloseConsumedGoods:5.28.0">
	<!-- Шаблон для типа STZ_PermitCloseConsumedGoodsType -->
	<xsl:template match="pccg:STZ_PermitCloseConsumedGoods">
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
																<td align="center">
																	<table style="display: inline-block; width: 25mm;">
																		<tbody>
																			<tr>
																				<td align="center">
																					<xsl:apply-templates select="pccg:PermissionRegNumber/pccg:CustomsCode"/>
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
																<td align="center">
																	<table style="display: inline-block; width: 25mm;">
																		<tbody>
																			<tr>
																				<td align="center">
																					<xsl:apply-templates select="pccg:PermissionRegNumber/pccg:RegistrationDate" mode="num_date"/>
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
																<td align="center">
																	<table style="display: inline-block; width: 25mm;">
																		<tbody>
																			<tr>
																				<td align="center">
																					<xsl:apply-templates select="pccg:PermissionRegNumber/pccg:Number"/>
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
																	<xsl:text>РЗП</xsl:text>
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
													<xsl:apply-templates select="pccg:AppCloseSTZ/pccg:Resident"/>
												</td>
											</tr>
											<tr>
												<td align="justify" valign="top" style="font-size: 8pt; border-top: 1px solid black;">
													(резидент (участник) особой экономической зоны (территории опережающего развития, свободного порта Владивосток), или участник 
													свободной экономической зоны, или иное лицо, определенное правом Евразийского экономического союза (далее - Заявитель) 
													(полное наименование организации, содержащее указание на ее организацинно-правовую форму (сокращенное наименование, 
													если такое наименование предусмотрено учредительным документом юридического лица) - для юридического лица или фамилия, имя, отчество 
													(при наличии) - для физического лица, идентификационный номер налогоплательщика (ИНН)
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
										Разрешение<br/>
										таможенного органа о завершении действия таможенной процедуры<br/>
										свободной таможенной зоны (заисключением случаев завершения такой процедуры<br/>
										на территориях Донецкой Народной Республики, Луганской Народной Республики,<br/>
										Запорожской области и Херсонской области)<br/>
										и приобретении товарами статуса товаров Евразийского экономического союза <br/>
										в отношении товаров, которые были израсходованы (потреблены)<br/>
										в соответствии с подпунктом 5 пункта 1 статьи 205 Таможенного кодекса<br/>
										Евразийского экономического союза 
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<p style="text-indent: 5mm;">
						Настоящее решение свидетельствует о завершении таможенной процедуры свободной таможенной зоны в отношении товаров по заявлению № 
						<xsl:apply-templates select="pccg:AppRegNum" mode="reg_num"/> 
						и приобретении товарами статуса товаров Евразийского экономического союза на основании подпункта 3 пункта 10 статьи 207 Таможенного кодекса 
						Евразийского экономического союза<sup>*</sup>
					</p>
					<p style="text-indent: 5mm;">
						Сведения о товарах, помещенных под таможенную процедуру свободной таможенной зоны, в отношении которых действие таможенной процедуры завершено, 
						на <span style="display: inline-block; width: 15mm; text-align: center; border-bottom: 1px solid black;">
							<xsl:apply-templates select="pccg:SheetsNumber"/>
						</span> 
						л.
					</p>
					<br/>
					<br/>
					<p style="text-indent: 5mm;">
						Раздел 1. Товары, помещенные под таможенную процедуру свободной таможенной зоны, и товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру 
						свободной таможенной зоны, потребленные при создании объектов недвижимости и являются составной (неотъемлемой) частью таких объектов недвижимости
					</p>
					<table style="table-layout: fixed; width: 100%">
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered font10" rowspan="2" width="5%">№ п/п</td>
								<td class="bordered font10" colspan="2">Объект недвижимости</td>
								<td class="bordered font10" colspan="4">Товары, помещенные под таможенную процедуру свободной таможенной зоны</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered font10">наименование</td>
								<td class="bordered font10">местонахождение</td>
								<td class="bordered font10">наименование товара</td>
								<td class="bordered font10">регистрационный номер декларации на товары</td>
								<td class="bordered font10">номер товара</td>
								<td class="bordered font10">количество / единица измерения</td>
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
							<xsl:for-each select="pccg:AppCloseSTZ/pccg:PropertyCreateGoods">
								<xsl:variable name="goods" select=".//*[local-name() = 'PropertyGoodsDecl' or local-name() = 'GoodsDecl']"/>
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
										<xsl:apply-templates select="pccg:Position"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pccg:PropertyName"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pccg:PropertyLocation" mode="address"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goods[1]/../pccg:GoodsDescription"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goods[1]/pccg:DeclRegNum" mode="reg_num"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]/pccg:GoodsDeclnfo/pccg:GoodsNumber">
											<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]/../pccg:GoodsQuantity">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="quantity"/>
										</xsl:for-each>
									</td>
								</tr>
								<xsl:for-each select="$goods[position() &gt; 1]">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="../pccg:GoodsDescription"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="pccg:DeclRegNum" mode="reg_num"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="pccg:GoodsDeclnfo/pccg:GoodsNumber">
												<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="../pccg:GoodsQuantity">
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
					<p style="text-indent: 5mm;">
						Раздел 2. Товары, помещенные под таможенную процедуру свободной таможенной зоны, и товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру 
						свободной таможенной зоны, потребленные при эксплуатации (содержании) объекта недвижимости
					</p>
					<table style="table-layout: fixed; width: 100%">
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered font10" rowspan="2" width="5%">№ п/п</td>
								<td class="bordered font10" colspan="3">Объект недвижимости</td>
								<td class="bordered font10" colspan="4">Товары, помещенные под таможенную процедуру свободной таможенной зоны</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered font10">наименование</td>
								<td class="bordered font10">местонахождение</td>
								<td class="bordered font10">вид работ</td>
								<td class="bordered font10">наименование товара</td>
								<td class="bordered font10">регистрационный номер декларации на товары</td>
								<td class="bordered font10">номер товара</td>
								<td class="bordered font10">количество / единица измерения</td>
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
							<xsl:for-each select="pccg:AppCloseSTZ/pccg:PropertyExplGoods">
								<xsl:variable name="goods" select=".//*[local-name() = 'ExploitationGoodsDecl' or local-name() = 'GoodsDecl']"/>
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
										<xsl:apply-templates select="pccg:Position"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pccg:PropertyName"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pccg:PropertyLocation" mode="address"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}"></td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goods[1]/../pccg:GoodsDescription"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goods[1]/pccg:DeclRegNum" mode="reg_num"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]/pccg:GoodsDeclnfo/pccg:GoodsNumber">
											<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]/../pccg:GoodsQuantity">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="quantity"/>
										</xsl:for-each>
									</td>
								</tr>
								<xsl:for-each select="$goods[position() &gt; 1]">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="../pccg:GoodsDescription"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="pccg:DeclRegNum" mode="reg_num"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="pccg:GoodsDeclnfo/pccg:GoodsNumber">
												<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="../pccg:GoodsQuantity">
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
					<p style="text-indent: 5mm;">
						Раздел 3. Товары, помещенные под таможенную процедуру свободной таможенной зоны, и товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру 
						свободной таможенной зоны, потребленные при ремонте (реконструкции) объекта недвижимости
					</p>
					<table style="table-layout: fixed; width: 100%">
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered font10" rowspan="2" width="5%">№ п/п</td>
								<td class="bordered font10" colspan="3">Объект недвижимости</td>
								<td class="bordered font10" colspan="4">Товары, помещенные под таможенную процедуру свободной таможенной зоны</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered font10">наименование</td>
								<td class="bordered font10">местонахождение</td>
								<td class="bordered font10">операции по ремонту</td>
								<td class="bordered font10">наименование товара</td>
								<td class="bordered font10">регистрационный номер декларации на товары</td>
								<td class="bordered font10">номер товара</td>
								<td class="bordered font10">количество / единица измерения</td>
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
							<xsl:for-each select="pccg:AppCloseSTZ/pccg:PropertyRepairGoods">
								<xsl:variable name="goods" select=".//*[local-name() = 'RepairGoodsDecl' or local-name() = 'GoodsDecl']"/>
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
										<xsl:apply-templates select="pccg:Position"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pccg:PropertyName"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pccg:PropertyLocation" mode="address"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pccg:ProcessingOperations"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goods[1]/../pccg:GoodsDescription"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goods[1]/pccg:DeclRegNum" mode="reg_num"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]/pccg:GoodsDeclnfo/pccg:GoodsNumber">
											<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]/../pccg:GoodsQuantity">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="quantity"/>
										</xsl:for-each>
									</td>
								</tr>
								<xsl:for-each select="$goods[position() &gt; 1]">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="../pccg:GoodsDescription"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="pccg:DeclRegNum" mode="reg_num"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="pccg:GoodsDeclnfo/pccg:GoodsNumber">
												<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="../pccg:GoodsQuantity">
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
					<p style="text-indent: 5mm;">
						Раздел 4. Товары, помещенные под таможенную процедуру свободной таможенной зоны, и товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру 
						свободной таможенной зоны, потребленные при эксплуатации и (или) техническом обслуживании оборудования, машин и агрегатов, помещенных под таможенную процедуру
						свободной таможенной зоны и используются Заявителем
					</p>
					<table style="table-layout: fixed; width: 100%">
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered font10" rowspan="2" width="5%">№ п/п</td>
								<td class="bordered font10" colspan="2">Объект недвижимости</td>
								<td class="bordered font10" colspan="4">Товары, помещенные под таможенную процедуру свободной таможенной зоны</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered font10">наименование оборудования</td>
								<td class="bordered font10">операция по эксплуатации и (или) техническому обслуживанию обоурдования</td>
								<td class="bordered font10">наименование товара</td>
								<td class="bordered font10">регистрационный номер декларации на товары</td>
								<td class="bordered font10">номер товара</td>
								<td class="bordered font10">количество / единица измерения</td>
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
							<!--xsl:for-each select="pccg:AppCloseSTZ/pccg:EquipmentExplGoods/pccg:EquipmentType">
								<tr valign="top">
									<td class="bordered font10">
										<xsl:apply-templates select="pccg:Position"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="pccg:EquipmentName"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="pccg:OperationsDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="pccg:OperationsDescription"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
									</td>
									<td class="bordered font10">
									</td>
									<td class="bordered font10">
									</td>
									<td class="bordered font10">
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="pccg:AppCloseSTZ/pccg:EquipmentExplGoods//*[local-name() = 'EquipmentGoodsDecl' or local-name() = 'GoodsDecl']">
								<tr valign="top">
									<td class="bordered font10">
									</td>
									<td class="bordered font10">
									</td>
									<td class="bordered font10">
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="../pccg:GoodsDescription"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="pccg:DeclRegNum" mode="reg_num"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="pccg:GoodsDeclnfo/pccg:GoodsNumber">
											<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="../pccg:GoodsQuantity">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="quantity"/>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each-->
							<xsl:for-each select="pccg:AppCloseSTZ/pccg:EquipmentExplGoods">
								<xsl:variable name="goodseq" select=".//*[local-name() = 'pccg:EquipmentGoodsSTZ/EquipmentGoodsDecl' or local-name() = 'GoodsDecl']"/>
								<xsl:variable name="rowspaneq">
									<xsl:choose>
										<xsl:when test="count($goodseq) != 0">
											<xsl:value-of select="count($goodseq)"/>
										</xsl:when>
										<xsl:otherwise>1</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr valign="top">
									<td class="bordered font10" rowspan="{$rowspaneq}">
										<xsl:apply-templates select="pccg:EquipmentType/pccg:Position"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspaneq}">
										<xsl:apply-templates select="pccg:EquipmentType/pccg:EquipmentName"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspaneq}">
										<xsl:for-each select="pccg:EquipmentType/pccg:OperationsDoc">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="pccg:OperationsDescription"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goodseq[1]/../pccg:GoodsDescription"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goodseq[1]/pccg:DeclRegNum" mode="reg_num"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goodseq[1]/pccg:GoodsDeclnfo/pccg:GoodsNumber">
											<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goodseq[1]/../pccg:GoodsQuantity">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="quantity"/>
										</xsl:for-each>
									</td>
								</tr>
								<xsl:for-each select="$goodseq[position() &gt; 1]">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="../pccg:GoodsDescription"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="pccg:DeclRegNum" mode="reg_num"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="pccg:GoodsDeclnfo/pccg:GoodsNumber">
												<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="../pccg:GoodsQuantity">
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
					<p style="text-indent: 5mm;">
						Раздел 5. Товары, помещенные под таможенную процедуру свободной таможенной зоны, и товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру 
						свободной таможенной зоны, потребленные при проведении Заявителем исследований, испытаний, тестирований, проверок, опытов или экспериментов
					</p>
					<table style="table-layout: fixed; width: 100%">
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered font10" rowspan="2" width="5%">№ п/п</td>
								<td class="bordered font10" rowspan="2">Наименование проведенной работы (исследования, испытания, тестирования, проверки, опыта, эксперимента)</td>
								<td class="bordered font10" colspan="4">Товары, помещенные под таможенную процедуру свободной таможенной зоны</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered font10">наименование товара</td>
								<td class="bordered font10">регистрационный номер декларации на товары</td>
								<td class="bordered font10">номер товара</td>
								<td class="bordered font10">количество / единица измерения</td>
							</tr>
							<tr align="center">
								<td class="bordered font10">1</td>
								<td class="bordered font10">2</td>
								<td class="bordered font10">3</td>
								<td class="bordered font10">4</td>
								<td class="bordered font10">5</td>
								<td class="bordered font10">6</td>
							</tr>
							<xsl:for-each select="pccg:AppCloseSTZ/pccg:ResearchGoods">
								<xsl:variable name="goods" select=".//*[local-name() = 'ResearchGoodsDecl' or local-name() = 'GoodsDecl']"/>
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
										<xsl:apply-templates select="pccg:Position"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="pccg:ResearchInfo"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goods[1]/../pccg:GoodsDescription"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="$goods[1]/pccg:DeclRegNum" mode="reg_num"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]/pccg:GoodsDeclnfo/pccg:GoodsNumber">
											<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="$goods[1]/../pccg:GoodsQuantity">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="quantity"/>
										</xsl:for-each>
									</td>
								</tr>
								<xsl:for-each select="$goods[position() &gt; 1]">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="../pccg:GoodsDescription"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="pccg:DeclRegNum" mode="reg_num"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="pccg:GoodsDeclnfo/pccg:GoodsNumber">
												<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="../pccg:GoodsQuantity">
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
					<table style="table-layout: fixed; width: 230mm;">
						<tbody>
							<tr valign="bottom">
								<td width="30%" align="center">
									<xsl:apply-templates select="pccg:CustomsSignature/cat_ru:PersonPost"/>
								</td>
								<td width="5%"></td>
								<td width="25%"></td>
								<td width="5%"></td>
								<td width="35%" align="center">
									<xsl:for-each select="pccg:CustomsSignature/*[contains(local-name(), 'ame')]">
										<xsl:if test="position() != 1">
											<xsl:text> </xsl:text>
										</xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr align="center" valign="top">
								<td style="font-size: 8pt; border-top: 1px solid black;">
									(начальник таможенного органа или лицо, его замещающее)
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
	
	<xsl:template match="pccg:AppRegNum">
		<xsl:apply-templates select="." mode="reg_num"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="pccg:AddNumber"/>
	</xsl:template>
	
	<xsl:template match="pccg:Resident">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'PersonId' or local-name() = 'IdentityCard']">
				<!-- считаем, что это ФЛ -->
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName)">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<!-- ЮЛ -->
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName)">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
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
	
	<xsl:template match="pccg:GoodsIdentification">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="pccg:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:Code"/>
	</xsl:template>
	
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/ </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/ </xsl:text>
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
	
	<xsl:template match="//*[local-name()='STZ_PermitCloseConsumedGoods']//*" priority="-1">
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
