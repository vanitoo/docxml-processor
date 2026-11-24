<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС от 8 октября 2020 г. N 888 "Об утверждении форм заявления о завершении таможенной процедуры свободной таможенной зоны в отношении товаров, указанных в частях 35 и 36 статьи 19 Федерального закона от 13 июля 2020 г. N 193-Ф3 "О государственной поддержке предпринимательской деятельности в Арктической зоне Российской Федерации", и решения таможенного органа о завершении действия таможенной процедуры свободной таможенной зоны в отношении таких товаров"
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oeznr="urn:customs.ru:Information:CustomsDocuments:OEZ_NotifReg:5.26.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:ac_stz="urn:customs.ru:Information:CustomsDocuments:AppCloseSTZ:5.28.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0">
	<xsl:param name="OEZ_NotifReg"/>
	<!-- Шаблон для типа AppCloseSTZType -->
	<xsl:template match="ac_stz:AppCloseSTZ">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  /*white-space: normal;*/
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 10mm;
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
                  font-size: 10pt;
                  /*font-style: italic;*/
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 10pt;
                  }
                  
                  .descr
                  {
                  font-family: Arial;
                  font-size: 7pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 10pt;
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
                  
                  .inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr valign="top">
								<td width="50%" align="left" valign="middle">
									<table width="95%">
										<tbody>
											<tr>
												<td class="bordered annot" style="height: 7mm;" valign="middle">
													<xsl:choose>
														<xsl:when test="$OEZ_NotifReg">
															<xsl:text>Регистрационный № </xsl:text>
															<xsl:apply-templates select="$OEZ_NotifReg/oeznr:RegistrationNumber" mode="reg_num"/>
															<xsl:text>/ЗЗП</xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text>Регистрационный № _______/______/_______/ЗЗП</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="50%">
									<table>
										<tbody>
											<tr valign="top">
												<td width="1%" class="annot">В</td>
												<td width="99%" class="value">
													<xsl:apply-templates select="ac_stz:Customs"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="descr">(наименование таможенного органа (с указанием кода таможенного органа))</td>
											</tr>
											<tr valign="top">
												<td class="annot">от</td>
												<td class="value">
													<xsl:apply-templates select="ac_stz:Resident"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="descr">(наименование юридического лица или фамилии, имени, отчества (при наличии) индивидуального предпринимателя, являющегося резидентом Арктической зоны Российской Федерации (далее - Заявитель) с указанием идентификационного номера налогоплательщика (ИНН), реквизитов свидетельства о включении в реестр резидентов Арктической зоны Российской Федерации)
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">

										Заявление<br/>
										о завершении действия таможенной процедуры свободной таможенной зоны<br/>
										в отношении товаров, указанных в частях 35 и 36 статьи 19 Федерального закона<br/> 
										от 13 июля 2020 г. N 193-ФЗ	"О государственной поддержке предпринимательской деятельности<br/>в Арктической зоне Российской Федерации"

								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="annot">&#160;&#160;&#160;&#160;Прошу завершить действие таможенной процедуры свободной таможенной зоны на основании статьи <xsl:apply-templates select="ac_stz:LowArticle"/> Федерального закона от 13 июля 2020 г. N 193-ФЗ "О государственной поддержке предпринимательской деятельности в Арктической зоне Российской Федерации" в отношении товаров, помещенных под таможенную процедуру свободной таможенной зоны, согласно представленным ниже сведениям на __<u>
										<xsl:value-of select="ac_stz:SheetsNumber"/>
									</u>__ л., для приобретения такими товарами статуса товаров Евразийского экономического союза.
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div class="annot">&#160;&#160;&#160;&#160;1. Сведения о реквизитах свидетельства о выполнении резидентом Арктической зоны Российской Федерации условий соглашения об осуществлении инвестиционной деятельности в Арктической зоне Российской Федерации (или указываются сведения о нормативном правовом акте, которым определено прекращение применения таможенной процедуры свободной таможенной зоны в Арктической зоне Российской Федерации) 
						<u>
							<xsl:apply-templates select="ac_stz:AgreementDoc"/>
							<xsl:apply-templates select="ac_stz:LegalAct" mode="doc"/>
						</u>
					</div>
					<br/>
					<br/>
					<div class="annot">&#160;&#160;&#160;&#160;2. Сведения о товарах, помещенных под таможенную процедуру свободной таможенной зоны.
					</div>
					<br/>
					<div class="annot">&#160;&#160;&#160;&#160;Раздел   1.  Товары,  помещенные  под  таможенную  процедуру  свободной таможенной   зоны,   и   товары,  изготовленные  (полученные)  из  товаров, помещенных под таможенную процедуру свободной таможенной зоны, потребленные
при   создании   объектов  недвижимости  на  территории  участка  резидента Арктической   зоны  и  являющиеся  составной  (неотъемлемой)  частью  таких объектов недвижимости
					</div>
					<br/>
					<xsl:if test="ac_stz:GoodsInfo/ac_stz:Equipment">
						<table>
							<tbody>
								<tr align="center" valign="top">
									<td class="bordered annot" rowspan="2">№ п/п</td>
									<td class="bordered annot" colspan="4">Оборудование</td>
									<td class="bordered annot" colspan="5">Товары, помещенные под таможенную процедуру свободной таможенной зоны</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">Наиме-<br/>нование оборудо-<br/>вания</td>
									<td class="bordered annot">Вид (класс) оборудо-<br/>вания в соот-<br/>ветствии со стандартами, техни- ческими условиями </td>
									<td class="bordered annot">Сведения о постановке оборудо-<br/>вания на баланс (принятие оборудо-<br/>вания к бухгал-<br/>терскому учету в качестве основных средств) Заявителя</td>
									<td class="bordered annot">Сведения о вводе оборудо-<br/>вания в эксплуатацию</td>
									<td class="bordered annot">Наимено-<br/>вание товара </td>
									<td class="bordered annot">Регистра-<br/>ционный номер декларации на товары</td>
									<td class="bordered annot">Номер товара</td>
									<td class="bordered annot">Количество/ единица измерения</td>
									<td class="bordered annot">Примечание</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
									<td class="bordered annot">7</td>
									<td class="bordered annot">8</td>
									<td class="bordered annot">9</td>
									<td class="bordered annot">10</td>
								</tr>
								<xsl:for-each select="ac_stz:GoodsInfo/ac_stz:Equipment">
									<tr valign="top">
										<xsl:variable name="goodsCount" select="count(descendant::ac_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:apply-templates select="ac_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:apply-templates select="ac_stz:EquipmentName"/>
										</td>
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:apply-templates select="ac_stz:EquipmentKind"/>
										</td>
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:for-each select="ac_stz:AccountDoc">
												<xsl:if test="position() != 1">;<br/>
												</xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:apply-templates select="ac_stz:CommissioningInfo"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ac_stz:CommissioningDate" mode="russian_date"/>
										</td>
										<xsl:variable name="goodsCountIn" select="count(ac_stz:EquipmentGoods[1]//ac_stz:GoodsDeclnfo)"/>
										<td class="bordered annot" rowspan="{$goodsCountIn}">
											<xsl:apply-templates select="ac_stz:EquipmentGoods[1]/ac_stz:GoodsDescription"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="ac_stz:EquipmentGoods[1]/ac_stz:EquipmentGoodsDecl[1]" mode="reg_num"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="ac_stz:EquipmentGoods[1]/ac_stz:EquipmentGoodsDecl[1]/ac_stz:GoodsDeclnfo[1]/ac_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="ac_stz:EquipmentGoods[1]/ac_stz:EquipmentGoodsDecl[1]/ac_stz:GoodsDeclnfo[1]/ac_stz:GoodsQuantity">
												<xsl:if test="position()!=1">
													<br/>
												</xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:apply-templates select="ac_stz:EquipmentGoods[1]/ac_stz:Comment"/>
										</td>
									</tr>
									<xsl:for-each select="ac_stz:EquipmentGoods[1]/descendant::ac_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr>
											<td class="bordered annot">
												<xsl:apply-templates select="parent::ac_stz:EquipmentGoodsDecl" mode="reg_num"/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="ac_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="ac_stz:GoodsQuantity">
													<xsl:if test="position()!=1">
														<br/>
													</xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="ac_stz:EquipmentGoods[position() &gt; 1]">
										<tr>
											<xsl:variable name="goodsCountIn2" select="count(descendant::ac_stz:GoodsDeclnfo)"/>
											<td class="bordered annot" rowspan="{$goodsCountIn2}">
												<xsl:apply-templates select="ac_stz:GoodsDescription"/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="ac_stz:EquipmentGoodsDecl[1]" mode="reg_num"/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="ac_stz:EquipmentGoodsDecl[1]/ac_stz:GoodsDeclnfo[1]/ac_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="ac_stz:EquipmentGoodsDecl[1]/ac_stz:GoodsDeclnfo[1]/ac_stz:GoodsQuantity">
													<xsl:if test="position()!=1">
														<br/>
													</xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
										<xsl:for-each select="descendant::ac_stz:GoodsDeclnfo[position() &gt; 1]">
											<tr>
												<td class="bordered annot">
													<xsl:apply-templates select="parent::ac_stz:EquipmentGoodsDecl" mode="reg_num"/>
												</td>
												<td class="bordered annot">
													<xsl:apply-templates select="ac_stz:GoodsNumber"/>
												</td>
												<td class="bordered annot">
													<xsl:for-each select="ac_stz:GoodsQuantity">
														<xsl:if test="position()!=1">
															<br/>
														</xsl:if>
														<xsl:apply-templates select="." mode="quantity"/>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<div class="annot">&#160;&#160;&#160;&#160;Раздел 2. Товары, помещенные под таможенную процедуру свободной таможенной зоны, использованные для создания объектов недвижимости в Арктической зоне Российской Федерации и являющиеся составной (неотъемлемой) частью таких объектов недвижимости
						</div>
					<br/>
					<xsl:for-each select="ac_stz:GoodsInfo/ac_stz:Property">
						<table>
							<tbody valign="top">
								<tr align="center">
									<td class="bordered annot" colspan="6">Объект недвижимости (<xsl:apply-templates select="ac_stz:PropertyName"/>)</td>
								</tr>
								<tr align="center">
									<td class="bordered annot">N п/п </td>
									<td class="bordered annot">Место нахождения объекта недвижимости (адрес) </td>
									<td class="bordered annot">Сведения о технической документации (техническом паспорте), проектной документации на объект недвижимости</td>
									<td class="bordered annot">Сведения о постановке объекта недвижимости на баланс (переводе объекта недвижимости в состав основных средств) Заявителя </td>
									<td class="bordered annot">Сведения о внесении записи о праве собственности резидента Арктической зоны Российской Федерации на объект недвижимости в Единый государственный реестр недвижимости </td>
									<td class="bordered annot">Примечание</td>
								</tr>
								<tr align="center">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
								</tr>
								<tr>
									<td class="bordered annot">
										<xsl:apply-templates select="ac_stz:Position"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="ac_stz:PropertyLocation" mode="address"/>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="ac_stz:TechDoc">
											<xsl:if test="position()!=1">;<br/>
											</xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="ac_stz:BalanceSheet">
											<xsl:if test="position()!=1">;<br/>
											</xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="ac_stz:OwnershipDoc">
											<xsl:if test="position()!=1">;<br/>
											</xsl:if>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="ac_stz:Comment"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody valign="top">
								<tr align="center">
									<td class="bordered annot" colspan="7">Товары, помещенные под таможенную процедуру свободной таможенной зоны и использованные при создании объекта недвижимости</td>
								</tr>
								<tr>
									<td class="bordered annot"/>
									<td class="bordered annot">Наименование товара </td>
									<td class="bordered annot">Регистрационный номер декларации на товары </td>
									<td class="bordered annot">Номер товара </td>
									<td class="bordered annot">Количество/единица измерения </td>
									<td class="bordered annot">Наименование составной (неотъемлемой) части объекта недвижимости согласно технической документации, при создании которой был использован товар </td>
									<td class="bordered annot">Примечание</td>
								</tr>
								<tr>
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
									<td class="bordered annot">7</td>
								</tr>
								<xsl:for-each select="ac_stz:PropertyGoods">
									<xsl:variable name="goodsCount" select="count(descendant::ac_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:apply-templates select="ac_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:apply-templates select="ac_stz:GoodsDescription"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="descendant::ac_stz:GoodsDeclnfo[1]/parent::ac_stz:PropertyGoodsDecl" mode="reg_num"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="descendant::ac_stz:GoodsDeclnfo[1]/ac_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="descendant::ac_stz:GoodsDeclnfo[1]/ac_stz:GoodsQuantity">
												<xsl:if test="position()!=1">;<br/>
												</xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:apply-templates select="ac_stz:ComponentUseName"/>
										</td>
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:apply-templates select="ac_stz:Comment"/>
										</td>
									</tr>
									<xsl:for-each select="descendant::ac_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="parent::ac_stz:PropertyGoodsDecl" mode="reg_num"/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="ac_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="ac_stz:GoodsQuantity">
													<xsl:if test="position()!=1">;<br/>
													</xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:for-each>
					<br/>
					<div class="annot">&#160;&#160;&#160;&#160;Раздел 3. Товары, помещенные под таможенную процедуру свободной таможенной зоны, являющиеся имуществом дополнительно установленным, смонтированным на объекте недвижимости, сведения о котором указаны в разделе 2, в ходе капитальных вложений</div>
					<br/>
					<xsl:if test="ac_stz:GoodsInfo/ac_stz:AddInstaled">
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered annot">N п/п </td>
									<td class="bordered annot">Наименование товара </td>
									<td class="bordered annot">Регистрационный номер декларации на товары</td>
									<td class="bordered annot">Номер товара</td>
									<td class="bordered annot">Количество/единица измерения</td>
									<td class="bordered annot">Наименование составной (неотъемлемой) части объекта недвижимости, где дополнительно установлен, смонтирован товар</td>
									<td class="bordered annot">Сведения о сдаче-приемке работ по установке дополнительно установленного, смонтированного имущества</td>
									<td class="bordered annot">Документы бухгалтерского учета Заявителя, свидетельствующие о проведенных работах по установке и монтажу товара</td>
								</tr>
								<tr valign="top" align="center">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
									<td class="bordered annot">7</td>
									<td class="bordered annot">8</td>
								</tr>
								<xsl:for-each select="ac_stz:GoodsInfo/ac_stz:AddInstaled">
									<xsl:variable name="goodsCount" select="count(descendant::ac_stz:GoodsDeclnfo)"/>
									<tr valign="top">
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:apply-templates select="ac_stz:Position"/>
										</td>
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:apply-templates select="ac_stz:GoodsDescription"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="descendant::ac_stz:GoodsDeclnfo[1]/parent::ac_stz:AddInstaledGoods" mode="reg_num"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="descendant::ac_stz:GoodsDeclnfo[1]/ac_stz:GoodsNumber"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="descendant::ac_stz:GoodsDeclnfo[1]/ac_stz:GoodsQuantity">
												<xsl:if test="position()!=1">;<br/>
												</xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:apply-templates select="ac_stz:ComponentName"/>
										</td>
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:for-each select="ac_stz:AcceptanceWork">
												<xsl:if test="position()!=1">;<br/>
												</xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot" rowspan="{$goodsCount}">
											<xsl:for-each select="ac_stz:AccountWorkDoc">
												<xsl:if test="position()!=1">;<br/>
												</xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</td>
									</tr>
									<xsl:for-each select="descendant::ac_stz:GoodsDeclnfo[position() &gt; 1]">
										<tr valign="top">
											<td class="bordered annot">
												<xsl:apply-templates select="parent::ac_stz:AddInstaledGoods" mode="reg_num"/>
											</td>
											<td class="bordered annot">
												<xsl:apply-templates select="ac_stz:GoodsNumber"/>
											</td>
											<td class="bordered annot">
												<xsl:for-each select="ac_stz:GoodsQuantity">
													<xsl:if test="position()!=1">;<br/>
													</xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<div class="annot">&#160;&#160;&#160;&#160;3. Опись представленных документов.</div>
					<br/>
					<table>
						<tbody>
							<tr valign="top" align="center">
								<td class="bordered annot">N п/п </td>
								<td class="bordered annot">Наименование документа </td>
								<td class="bordered annot">Реквизиты и дата документа </td>
								<td class="bordered annot">Количество листов</td>
							</tr>
							<tr valign="top" align="center">
								<td class="bordered annot">1</td>
								<td class="bordered annot">2</td>
								<td class="bordered annot">3</td>
								<td class="bordered annot">4</td>
							</tr>
							<xsl:for-each select="ac_stz:PresentedDoc">
								<tr valign="top" align="left">
									<td class="bordered annot">
										<xsl:apply-templates select="ac_stz:Position"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="cat_ru:PrDocumentName"/>
									</td>
									<td class="bordered annot">
										<xsl:if test="cat_ru:PrDocumentNumber">
											<xsl:text>№ </xsl:text>
										</xsl:if>
										<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
										<xsl:if test="cat_ru:PrDocumentDate">
											<xsl:text> от </xsl:text>
										</xsl:if>
										<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="ac_stz:SheetsNumber"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:apply-templates select="ac_stz:ResidentSignature"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ac_stz:ResidentSignature">
		<table>
			<tbody>
				<tr valign="bottom" align="center">
					<td style="border-bottom:1px solid black;" width="35%" class="annot">
						<xsl:apply-templates select="cat_ru:PersonPost"/>
					</td>
					<td width="5%"/>
					<td style="border-bottom:1px solid black;" width="20%"/>
					<td width="5%"/>
					<td style="border-bottom:1px solid black;" width="35%" class="annot">
						<xsl:apply-templates select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
				<tr valign="top" align="center">
					<td class="descr">(Резидент Арктической зоны Российской Федерации)</td>
					<td/>
					<td class="descr">(подпись)</td>
					<td/>
					<td class="descr">(Фамилия, имя, отчество (при наличии)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="ac_stz:AgreementDoc">
		<xsl:text> номер </xsl:text>
		<xsl:apply-templates select="ac_stz:AgreementNumber"/>
		<xsl:if test="ac_stz:AgreementSeries">
			<xsl:text> серия </xsl:text>
			<xsl:apply-templates select="ac_stz:AgreementSeries"/>
		</xsl:if>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="ac_stz:AgreementDate" mode="russian_date"/>
	</xsl:template>
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
		<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ac_stz:PropertyGoodsDecl | ac_stz:GoodsDecl | ac_stz:ExploitationGoodsDecl | ac_stz:RepairGoodsDecl | ac_stz:EquipmentType | ac_stz:EquipmentGoodsDecl | ac_stz:ResearchGoodsDecl">
		<xsl:apply-templates select="ac_stz:DeclRegNum" mode="reg_num"/>
		<xsl:apply-templates select="ac_stz:CustomsDoc" mode="doc"/>
	</xsl:template>
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="date_num"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber' or local-name() = 'Number']"/>
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
	<xsl:template match="ac_stz:PropertyLocation">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="ac_stz:Resident">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<!--физлицо-->
			<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures" mode="IKO">
				<xsl:with-param name="isFL" select="1"/>
			</xsl:apply-templates>
			<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="identity_card"/>
		</xsl:if>
		<xsl:if test="not(RUScat_ru:IdentityCard)">
			<!-- юрлицо -->
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures" mode="IKO"/>
			<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
		</xsl:if>
		<xsl:apply-templates select="ac_stz:ResidentCertificate"/>
	</xsl:template>
	<xsl:template match="ac_stz:ResidentCertificate">
		<xsl:text> свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="ac_stz:CertificateNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="ac_stz:CertificateDate" mode="russian_date"/>
	</xsl:template>
	<xsl:template match="*" mode="identity_card">
		<xsl:text> документ: </xsl:text>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:text>; </xsl:text>
	</xsl:template>
	<xsl:template match="*" mode="IKO">
		<xsl:param name="isFL" select="'0'"/>
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name() = 'INN'">
					<xsl:text> ИНН: </xsl:text>
					<xsl:apply-templates select="."/>
					<xsl:text>; </xsl:text>
				</xsl:when>
				<xsl:when test="local-name() = 'OGRN'">
					<xsl:text> ОГРН</xsl:text>
					<xsl:if test="$isFL = '1'">ИП</xsl:if>
					<xsl:text>: </xsl:text>
					<xsl:apply-templates select="."/>
					<xsl:text>; </xsl:text>
				</xsl:when>
				<xsl:when test="local-name() = 'KPP' and $isFL = '0'">
					<xsl:text> KPP: </xsl:text>
					<xsl:apply-templates select="."/>
					<xsl:text>; </xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="local-name() = 'AddressKindCode'">
					<xsl:choose>
						<xsl:when test=". = 1"> адрес регистрации </xsl:when>
						<xsl:when test=". = 2"> фактический адрес </xsl:when>
						<xsl:when test=". = 3"> почтовый адрес </xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:text>; </xsl:text>
	</xsl:template>
	<xsl:template match="ac_stz:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
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
	<xsl:template name="date_num">
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
	<xsl:template match="//*[local-name()='AppCloseSTZ']//*" priority="-1">
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
	<xsl:template match="*" mode="date_num">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="date_num">
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
