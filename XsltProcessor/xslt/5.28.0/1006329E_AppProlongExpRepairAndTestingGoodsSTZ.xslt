<?xml version="1.0" encoding="utf-8"?>
<!--Приказ Минфина России № 309н от 16 декабря 2020 года "Об определении формы заявления на вывоз товаров, помещенных под таможенную процедуру свободной таможенной зоны, и (или) товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, с территории Арктической зоны Российской Федерации, на которой применяется таможенная процедура свободной таможенной зоны, на остальную часть таможенной территории Евразийского экономического союза без завершения действия таможенной процедуры свободной таможенной зоны для совершения операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза, и формы разрешения таможенного органа на такой вывоз", описание структуры "Заявления на продление срока обратного ввоза товаров.." в "СТРУКТУРА ФОРМАТ ВВ 309н.docx"-->
<xsl:stylesheet version="1.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:apertg_stz="urn:customs.ru:Information:CustomsDocuments:AppProlongExpRepairAndTestingGoodsSTZ:5.28.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0">
	<!-- Шаблон для типа AppProlongExpRepairAndTestingGoodsSTZType -->
	<xsl:template match="//*[local-name()='apertg_stz:AppProlongExpRepairAndTestingGoodsSTZ']//*" priority="-1">
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
	<xsl:template match="apertg_stz:AppProlongExpRepairAndTestingGoodsSTZ">
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
					width: 180mm;
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
                  vertical-align:bottom;
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

					.graphLittle 
					{
					font-family: Arial;
					font-size: 7pt;
					text-align: center;
					}

                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  font-size: 10pt;
                  }
                  

					.descr
					{font-size: 8pt;
					text-align: center;
					vertical-align: top;}

				.delim_3 {
				height: 3pt;
				}

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table class="graphMain" width="100%">
										<tbody>
											<tr>
												<td align="right" valign="bottom" width="45%">В </td>
												<td align="center" width="55%" class="value">
													<xsl:apply-templates select="apertg_stz:Customs" mode="CustomsOffice"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td valign="top" class="graphLittle">
													<xsl:text>(наименование таможенного органа (с указанием кода таможенного органа))</xsl:text>
												</td>
											</tr>
											<tr>
												<td align="right" valign="bottom">от </td>
												<td align="center" class="value">
													<xsl:apply-templates mode="organization" select="apertg_stz:Resident"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="graphLittle">
													<xsl:text>(резидент Арктической зоны Российской Федерации (наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое наименование предусмотрено учредительным документом юридического лица), основной государственный регистрационный номер (ОГРН), идентификационный номер налогоплательщика (ИНН) и код причины постановки на учет в налоговом органе (КПП), присвоенные юридическому лицу в соответствии с законодательством Российской Федерации о налогах и сборах, адрес места нахождения юридического лица - для юридического лица; фамилия, имя, отчество (при наличии), адрес, по которому постоянно проживает или зарегистрировано физическое лицо, идентификационный номер налогоплательщика (ИНН), основной государственный регистрационный номер индивидуального предпринимателя (ОГРНИП) и сведения о документе, удостоверяющем личность физического лица - для физического лица))</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<xsl:text>Регистрационный № </xsl:text>
									<xsl:value-of select="apertg_stz:AppProlongRegNum/apertg_stz:CustomsCode"/>
									<xsl:text>/</xsl:text>
									<xsl:apply-templates mode="gtd_date" select="apertg_stz:AppProlongRegNum/apertg_stz:RegistrationDate"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="apertg_stz:AppProlongRegNum/apertg_stz:Number"/>
									<xsl:text>/ЗВРПС</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:text>Заявление</xsl:text>
											<br/>
											<xsl:text>на продление срока обратного ввоза товаров, помещенных под таможенную процедуру свободной таможенной зоны, и (или) товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, с территории Арктической зоны Российской Федерации, на которой применяется таможенная процедура свободной таможенной зоны, на остальную часть таможенной территории Евразийского экономического союза без завершения действия таможенной процедуры свободной таможенной зоны для совершения операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза</xsl:text>
										</b>
									</font>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>Прошу продлить срок обратного ввоза товаров, помещенных под таможенную процедуру свободной таможенной зоны, и (или) товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, с территории Арктической зоны Российской Федерации, на которой применяется таможенная процедура свободной таможенной зоны, на остальную часть таможенной территории Евразийского экономического союза без завершения действия таможенной процедуры свободной таможенной зоны на основании части 14 статьи 20 Федерального закона от 13 июля 2020 г. N 193-ФЗ "О государственной поддержке предпринимательской деятельности в Арктической зоне Российской Федерации", вывозимых в соответствии с заявлением № </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="apertg_stz:AppRegNumber/apertg_stz:CustomsCode"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates mode="gtd_date" select="apertg_stz:AppRegNumber/apertg_stz:RegistrationDate"/>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="apertg_stz:AppRegNumber/apertg_stz:Number"/>
											<xsl:text>/ЗВР</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(регистрационный номер Заявления на вывоз с участка резидента Арктической зоны)'"/>
										<xsl:with-param name="width" select="'70mm'"/>
									</xsl:call-template>
									<xsl:text> согласно прилагаемому списку.</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>1. Причины продления срока обратного ввоза товаров:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="apertg_stz:Reason"/>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>2. Запрашиваемый срок продления:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates mode="russian_date" select="apertg_stz:RequestPeriod"/>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>3. Сведения о товарах, по которым продлевается срок обратного ввоза.</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td>
									<table class="graphMain" width="100%">
										<tbody>
											<!--tr>
												<td width="5%"/>
												<td width="18%"/>
												<td width="14%"/>
											</tr-->
											<tr>
												<td class="bordered" align="center">N п/п</td>
												<td class="bordered" align="center">Наименование товара (оборудования, части, узла, агрегата)</td>
												<td class="bordered" align="center">N п/п товара из Заявления на вывоз товаров с участка резидента Арктической зоны</td>
											</tr>
											<tr>
												<td class="bordered" align="center">1</td>
												<td class="bordered" align="center">2</td>
												<td class="bordered" align="center">3</td>
											</tr>
											<xsl:for-each select="apertg_stz:GoodsInfo">
												<tr valign="top">
													<td class="bordered">
														<xsl:value-of select="position()"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="apertg_stz:GoodsDescription"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="apertg_stz:Position"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>4. Опись представленных документов.</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td>
									<table class="graphMain" width="100%">
										<tbody>
											<tr>
												<td width="5%"/>
												<td width="35%"/>
												<td width="35%"/>
												<td width="30%"/>
											</tr>
											<tr>
												<td class="bordered" align="center">N п/п</td>
												<td class="bordered" align="center">Наименование документа</td>
												<td class="bordered" align="center">Реквизиты и дата документа</td>
												<td class="bordered" align="center">Количество листов</td>
											</tr>
											<tr>
												<td class="bordered" align="center">1</td>
												<td class="bordered" align="center">2</td>
												<td class="bordered" align="center">3</td>
												<td class="bordered" align="center">4</td>
											</tr>
											<xsl:for-each select="apertg_stz:PresentedDoc">
												<tr valign="top">
													<td class="bordered">
														<xsl:apply-templates select="apertg_stz:Position"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="cat_ru:PrDocumentName"/>
													</td>
													<td class="bordered">
														<xsl:if test="cat_ru:PrDocumentNumber">
															<xsl:text> №  </xsl:text>
															<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentDate">
															<xsl:text> от </xsl:text>
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</xsl:if>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="apertg_stz:SheetsNumber"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr valign="bottom">
												<td align="center" class="value" width="25%">
													<xsl:apply-templates select="apertg_stz:Resident/cat_ru:OrganizationName"/>
												</td>
												<td width="15%"/>
												<td class="value" width="15%"/>
												<td width="15%"/>
												<td align="center" class="value" width="30%">
													<xsl:apply-templates mode="PersonBase" select="apertg_stz:ResidentSignature"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">(резидент Арктической зоны)</td>
												<td/>
												<td class="graphLittle">(подпись)</td>
												<td/>
												<td class="graphLittle">(фамилия, имя, отчество (при наличии))</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description"/><sup><xsl:value-of select="$supIndexDescr"/></sup>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="gtd_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="gtd_date">
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
	<xsl:template match="*" mode="decl">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="*" mode="doc_base">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="catProc_ru:CustomsDocumentCode"> (<xsl:apply-templates select="catProc_ru:CustomsDocumentCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template mode="goods_group" match="*">
		<xsl:if test="catESAD_cu:Manufacturer">
			<xsl:text> Производитель </xsl:text>
			<xsl:apply-templates select="catESAD_cu:Manufacturer"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:ManufacturerINN">
			<xsl:text> ИНН производителя </xsl:text>
			<xsl:apply-templates select="catESAD_cu:ManufacturerINN"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:TradeMark">
			<xsl:text> Тов.знак </xsl:text>
			<xsl:apply-templates select="catESAD_cu:TradeMark"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsMark">
			<xsl:text> Торг. знак, марка </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsMark"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsModel">
			<xsl:text> Модель </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsModel"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsMarking">
			<xsl:text> Артикул</xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsMarking"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsStandard">
			<xsl:text> Стандарт </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsStandard"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsSort">
			<xsl:text> Сорт: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsSort"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:WoodDescriptionDetails">
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment">
				<xsl:text> Наим.сортимента: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind">
				<xsl:text> Порода древесины: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName">
				<xsl:text> Наименование сорта:</xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails">
				<xsl:text> Припуск по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="size_details" select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails">
				<xsl:text> Отклонения по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="size_details" select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails">
				<xsl:text> Диапазон диаметров: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MinRangeMeasure" mode="SupplementaryQuantity"/>
				<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MaxRangeMeasure"> - <xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MaxRangeMeasure" mode="SupplementaryQuantity"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure">
				<xsl:text> Объем товара в соответствии с контрактом: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure" mode="SupplementaryQuantity"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure">
				<xsl:text> Фактический объем товара: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure" mode="SupplementaryQuantity"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="catESAD_cu:Dimensions">
			<xsl:text> Размеры </xsl:text>
			<xsl:apply-templates mode="size_details" select="catESAD_cu:Dimensions"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:DateIssue">
			<xsl:text> Дата выпуска </xsl:text>
			<xsl:apply-templates select="catESAD_cu:DateIssue" mode="russian_date"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:SerialNumber">
			<xsl:text> Серийный номер: </xsl:text>
			<xsl:for-each select="catESAD_cu:SerialNumber">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsGroupQuantity">
			<xsl:text> Кол-во </xsl:text>
			<xsl:for-each select="catESAD_cu:GoodsGroupQuantity">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
				<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
					<xsl:text> (</xsl:text>
					<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="size_details" match="*">
		<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)<xsl:if test="catESAD_cu:WidthMeasure">
			<xsl:if test="catESAD_cu:LengthMeasure">
				<xsl:text> x </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
		<xsl:if test="catESAD_cu:HeightMeasure">
			<xsl:if test="catESAD_cu:LengthMeasure or catESAD_cu:WidthMeasure">
				<xsl:text> x </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='MeasureUnitQualifierCode'">(<xsl:apply-templates select="."/>)</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="Certificate">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='CertificateDate'">
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="local-name()='CertificateValidity'">
					<xsl:text>(срок действия: до   </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="PersonBase">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
			<xsl:text>,&#160;</xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PersonSurname">
			<xsl:value-of select="cat_ru:PersonSurname"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="CustomsOffice">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:Code">
			<xsl:if test="cat_ru:OfficeName">
				<xsl:text> (</xsl:text>
				<xsl:value-of select="cat_ru:Code"/>
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">,&#032;</span>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">:&#032;</span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">,&#032;</span>
			<span class="italic">ОГРН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">,&#032;</span>
			<span class="italic">БИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">,&#032;</span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">,&#032;</span>
			<span class="italic">ИТН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal">&#032;/&#032;</span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">,&#032;</span>
			<span class="italic">УНП</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">,&#032;</span>
			<span class="italic">УНН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">,&#032;</span>
			<span class="italic">N справки об отсутв. НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="organization" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="ru_address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="apertg_stz:ResidentCertificate">
			<xsl:text> свидетельство  </xsl:text>
			<xsl:for-each select="apertg_stz:ResidentCertificate">
				<xsl:apply-templates select="." mode="Certificate"/>
				<xsl:if test="position()!=last()">
					<xsl:text>,</xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>окончание срока действия: </xsl:text>
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last() and not(local-name()='IdentityCardSeries')">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="local-name()='IdentityCardSeries'">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
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
</xsl:stylesheet>
