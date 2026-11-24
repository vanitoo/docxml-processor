<?xml version="1.0" encoding="utf-8"?>
<!--
Проект приказа Минфина России "Порядок выдачи разрешения на переработку товаров ..."
ppg:ProcessingProcedureCode = 21 - переработка вне ТТ
ppg:ProcessingProcedureCode = 51 - переработка на ТТ
ppg:ProcessingProcedureCode = 91 - переработка для внутреннего потребления
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0" xmlns:ppg="urn:customs.ru:Information:ProcessingDocuments:PermitProcessingGoods:5.28.0">
	<!-- Шаблон для типа PermitProcessingGoodsType -->
	<xsl:template match="ppg:PermitProcessingGoods">
		<xsl:param name="w" select="180"/>
		<html>
			<head>
				<style>
                  body {
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

                  table.int
                  {
                  width: 96%;
                  margin-left: 5px;
                  margin-right: 5px;
                  table-layout: fixed;
                  }

                  table.ext_border
                  {
                  width: 100%;
                  border: 1px solid windowtext;
                  border-collapse: separate;
                  table-layout: fixed;
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
                  vertical-align:bottom;
                  }

                  .annot
                  {
                  /*font-weight:bold;*/
                  font-family: Arial;
                  font-size: 10pt;
                  }

                  td.annot
                  {
                  vertical-align:bottom;
                  padding-top: 5px;
                  }

                  .annot_t
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  vertical-align:top;
                  }

                  .underline
                  {
                  font-family: Arial;
                  font-size: 7pt;
                  vertical-align:top;
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

                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<xsl:variable name="cnt_ProcOrganization" select="count(ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcOrganization)"/>
					<br/>
					<xsl:choose>
						<!-- ************************************************************************************************************************************************************************************************** -->
						<!-- ************* переработка ВНЕ ТТ *********************************************************************************************************************************************************** -->
						<!-- ************************************************************************************************************************************************************************************************** -->
						<xsl:when test="ppg:ProcessingProcedureCode='21'">
							<table>
								<tbody>
									<tr>
										<td width="65%" class="value"><xsl:value-of select="ppg:CustomsAdministration"/></td>
										<td width="2%" class="annot"/>
										<td width="33%" class="annot_t"><!--xsl:text>таможенное управление</xsl:text--></td>
									</tr>
									<tr>
										<td class="underline" align="center"><xsl:text>(наименование регионального таможенного управления)</xsl:text></td>
										<td class="annot" colspan="2"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="ppg:Customs">
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>(</xsl:text>
												</xsl:if>
												<xsl:value-of select="cat_ru:Code"/>
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>) </xsl:text>
													<xsl:value-of select="cat_ru:OfficeName"/>
												</xsl:if>
											</xsl:for-each>
										</td>
										<td class="annot"/>
										<td class="annot_t"><!--xsl:text>таможня</xsl:text--></td>
									</tr>
									<tr>
										<td class="underline" align="center"><xsl:text>(наименование таможни)</xsl:text></td>
										<td class="annot" colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>
													<xsl:text>Разрешение на переработку</xsl:text>
													<br/>
													<xsl:text>товаров вне таможенной территории</xsl:text>
												</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr>
										<td align="center" class="annot">
											<xsl:text>№ </xsl:text>
											<u>&#160;&#160;<xsl:apply-templates select="ppg:PermitNumber"/>&#160;&#160;</u>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<xsl:call-template name="Status"/>
							<br/>
							<xsl:call-template name="Applicant">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:Applicant"/>
								<xsl:with-param name="place_name" select="'Место нахождения: '"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>2. Товары Евразийского экономического союза:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcessingGoods"/>
								<xsl:with-param name="title_col4" select="'Количество'"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>3. Нормы выхода продуктов переработки:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="ppg:AppInfomation/ppg:InfoFromApp/ppg:YieldNorm">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>4. Продукты переработки:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:PrResult"/>
								<xsl:with-param name="title_col4" select="'Количество'"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;text-align:justify;">
											<xsl:text>5. Документы, на основании которых товары Евразийского экономического союза будут передаваться лицу (лицам), осуществляющему(им) операции по переработке:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcOrganization/catProc_ru:Contract">
											<xsl:apply-templates select="." mode="doc"/>
											<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="underline" align="center"><xsl:text>(наименование(ия), номер(а) и дата(ы) их подписания)</xsl:text></td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;text-align:justify;">
											<xsl:text>6. Лицо (лица), непосредственно совершающие операции по переработке товаров:</xsl:text>
										</p>
									</td>
								</tr>
								<xsl:choose>
									<xsl:when test="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcOrganization">
										<xsl:variable name="cnt_org" select="count(ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcOrganization)"/>
										<xsl:for-each select="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcOrganization">
											<tr>
												<td class="underline"> <br/></td>
											</tr>
											<tr>
												<td class="annot">
													<xsl:if test="$cnt_org &gt; 1"><xsl:text>6.</xsl:text><xsl:value-of select="position()"/><xsl:text> </xsl:text></xsl:if>
													<xsl:text>полное и краткое наименование:</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="value">
													<xsl:value-of select="cat_ru:OrganizationName"/>
													<xsl:if test="cat_ru:ShortName">
														<xsl:if test="cat_ru:OrganizationName">
															<xsl:text> (</xsl:text>
														</xsl:if>
														<xsl:value-of select="cat_ru:ShortName"/>
														<xsl:if test="cat_ru:OrganizationName">
															<xsl:text>)</xsl:text>
														</xsl:if>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="annot">
													<xsl:text>место нахождения: </xsl:text>
												</td>
											</tr>
											<tr>
												<td class="value">
													<xsl:apply-templates select="catProc_ru:Address"/>
													<br/>
												</td>
											</tr>
											<tr>
												<td class="annot">
													<xsl:text>место нахождения его(их) производственных мощностей: </xsl:text>
												</td>
											</tr>
											<tr>
												<td class="value">
													<xsl:for-each select="catProc_ru:FactoryPlace">
														<xsl:apply-templates select="."/>
														<xsl:if test="position()!=last()">; </xsl:if>
													</xsl:for-each>	
													<br/>
												</td>
											</tr>
											<tr>
												<td class="annot">
													<xsl:text>адрес электронной почты, телефон (ы), факс: </xsl:text>
												</td>
											</tr>
											<tr>
												<td class="value">
													<xsl:for-each select="catProc_ru:Contact">
														<xsl:apply-templates select="."/>
														<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
													</xsl:for-each>
													<br/>
												</td>
											</tr>
										</xsl:for-each>	
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="value" align="center"><xsl:text>См. п. 1</xsl:text></td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;text-align:justify;">
											<xsl:text>7. Способ (способы) идентификации товаров Евразийского экономического союза в продуктах их переработки:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:call-template name="IdentificationMethod"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>8. Срок переработки:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="DateLimit"/>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;text-align:justify;">
											<xsl:text>9. Замена продуктов переработки эквивалентными иностранными товарами:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="Substitute">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:SubstituteGoods/catProc_ru:ReplacementGoogsOut"/>
								<xsl:with-param name="title_col4" select="'Количество'"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<xsl:text>Ввоз эквивалентных иностранных товаров до вывоза продуктов переработки:</xsl:text>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:apply-templates select="ppg:AppInfomation/ppg:InfoFromApp/ppg:SubstituteMovingGoods"/>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>10. Краткое описание производственного процесса:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcessingOperations">
											<xsl:if test="position() &gt; 1">;<br/></xsl:if>
											<xsl:value-of select="catProc_ru:OperationName"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="catProc_ru:OperationMethod"/>
											<xsl:text>. Срок совершения операции: </xsl:text>
											<xsl:value-of select="catProc_ru:OperationTerm"/>
										</xsl:for-each>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>11. Особые отметки таможни:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:call-template name="CustomsMark"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot">
										<xsl:apply-templates select="ppg:PersonSignature">
											<xsl:with-param name="fio_descr" select="'(Фамилия, имя, отчество (при наличии) начальника таможни (либо лица его замещающего)'"/>
										</xsl:apply-templates>
									</td>
								</tr>
								<tr>
									<td class="underline"> <br/></td>
								</tr>
							</table>
						</xsl:when>
						<!-- ************************************************************************************************************************************************************************************************** -->
						<!-- ************* переработка НА ТТ ************************************************************************************************************************************************************ -->
						<!-- ************************************************************************************************************************************************************************************************** -->
						<xsl:when test="ppg:ProcessingProcedureCode='51'">
							<table>
								<tbody>
									<tr>
										<td width="65%" class="value"><xsl:value-of select="ppg:CustomsAdministration"/></td>
										<td width="2%" class="annot"/>
										<td width="33%" class="annot_t"><!--xsl:text>таможенное управление</xsl:text--></td>
									</tr>
									<tr>
										<td class="underline" align="center"><xsl:text>(наименование регионального таможенного управления)</xsl:text></td>
										<td class="annot" colspan="2"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="ppg:Customs">
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>(</xsl:text>
												</xsl:if>
												<xsl:value-of select="cat_ru:Code"/>
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>) </xsl:text>
													<xsl:value-of select="cat_ru:OfficeName"/>
												</xsl:if>
											</xsl:for-each>
										</td>
										<td class="annot"/>
										<td class="annot_t"><!--xsl:text>таможня</xsl:text--></td>
									</tr>
									<tr>
										<td class="underline" align="center"><xsl:text>(наименование таможни)</xsl:text></td>
										<td class="annot" colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>
													<xsl:text>Разрешение на переработку</xsl:text>
													<br/>
													<xsl:text>товаров на таможенной территории</xsl:text>
												</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr>
										<td align="center" class="annot">
											<xsl:text>№ </xsl:text>
											<u>&#160;&#160;<xsl:apply-templates select="ppg:PermitNumber"/>&#160;&#160;</u>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<xsl:call-template name="Status"/>
							<br/>
							<xsl:call-template name="Applicant">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:Applicant"/>
							</xsl:call-template>
							<br/>
							<xsl:if test="ppg:Recipient">
								<xsl:call-template name="Applicant">
									<xsl:with-param name="node" select="ppg:Recipient"/>
									<xsl:with-param name="isRecipient" select="'1'"/>
								</xsl:call-template>
							</xsl:if>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;text-align:justify;">
											<xsl:text>2. Документы, подтверждающие право владения, пользования и (или) распоряжения иностранными товарами:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcessingDocuments">
											<xsl:apply-templates select="." mode="doc"/>
											<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>3. Иностранные товары:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcessingGoods"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;text-align:justify;">
											<xsl:text>4. Нормы выхода продуктов переработки, отходов, остатков и производственных потерь в относительном (в процентах) или в абсолютном значении:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="ppg:AppInfomation/ppg:InfoFromApp/ppg:YieldNorm">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;text-align:justify;">
											<xsl:text>5. Продукты переработки:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:PrResult"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>6. Отходы:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:WasteProductsItem"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>6.1. Отходы подлежат помещению под таможенную процедуру:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:value-of select="ppg:WasteProcessingProcedureCode"/>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>7. Остатки:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:Heels"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>8. Производственные потери:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType2">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:Loss"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;text-align:justify;">
											<xsl:text>9. Способ (способы) идентификации ввезенных товаров в продуктах их переработки:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:call-template name="IdentificationMethod"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>10. Срок переработки:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="DateLimit"/>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>11. Замена иностранных товаров эквивалентными товарами ЕАЭС:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="Substitute">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:SubstituteGoods/catProc_ru:ReplacementGoogsIn"/>
								<xsl:with-param name="need_col_5" select="'0'"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<xsl:text>Вывоз продуктов переработки будет осуществляться до ввоза иностранных товаров:</xsl:text>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:apply-templates select="ppg:AppInfomation/ppg:InfoFromApp/ppg:SubstituteMovingGoods"/>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<xsl:text>Срок ввоза иностранных товаров:</xsl:text>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="ppg:MovingGoodsDate"/>
										</xsl:call-template>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>12. Краткое описание производственного процесса:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcessingOperations">
											<xsl:if test="position() &gt; 1">;<br/></xsl:if>
											<xsl:value-of select="catProc_ru:OperationName"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="catProc_ru:OperationMethod"/>
											<xsl:text>. Срок совершения операции: </xsl:text>
											<xsl:value-of select="catProc_ru:OperationTerm"/>
										</xsl:for-each>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>13.Организация-переработчик (организации-переработчики):</xsl:text>
										</p>
									</td>
								</tr>
								<xsl:choose>
									<xsl:when test="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcOrganization">
										<xsl:for-each select="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcOrganization">
											<xsl:variable name="pos">
												<xsl:choose>
													<xsl:when test="$cnt_ProcOrganization &gt; 1">
														<xsl:value-of select="position()"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="0"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:variable>
											<xsl:apply-templates select=".">
												<xsl:with-param name="num_pp" select="'13'"/>
												<xsl:with-param name="position" select="$pos"/>
											</xsl:apply-templates>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>	
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="value" align="center"><xsl:text>См. п. 1</xsl:text></td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>14. Товары ЕАЭС, используемые при совершении операций по переработке:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType2">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:GoodsProcessImplementation"/>
								<xsl:with-param name="title_col4" select="'Количество в единицах измерения по ТН ВЭД ЕАЭС'"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>15. Особые отметки таможни:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:call-template name="CustomsMark"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot">
										<xsl:apply-templates select="ppg:PersonSignature">
											<xsl:with-param name="fio_descr" select="'(Фамилия, имя, отчество (при наличии) начальника таможни (либо лица его замещающего)'"/>
										</xsl:apply-templates>
									</td>
								</tr>
								<tr>
									<td class="underline"> <br/></td>
								</tr>
							</table>
						</xsl:when>
						<!-- ************************************************************************************************************************************************************************************************** -->
						<!-- ************* переработка для ВНУТРЕННЕГО использования ************************************************************************************************************************* -->
						<!-- ************************************************************************************************************************************************************************************************** -->
						<xsl:when test="ppg:ProcessingProcedureCode='91'">
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>
													<xsl:text>Разрешение на переработку товаров</xsl:text>
													<br/>
													<xsl:text>для внутреннего потребления</xsl:text>
												</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td width="65%" class="value"><xsl:value-of select="ppg:CustomsAdministration"/></td>
										<td width="2%" class="annot"/>
										<td width="33%" class="annot_t"><!--xsl:text>таможенное управление</xsl:text--></td>
									</tr>
									<tr>
										<td class="underline" align="center"><xsl:text>(наименование регионального таможенного управления)</xsl:text></td>
										<td class="annot" colspan="2"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="ppg:Customs">
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>(</xsl:text>
												</xsl:if>
												<xsl:value-of select="cat_ru:Code"/>
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>) </xsl:text>
													<xsl:value-of select="cat_ru:OfficeName"/>
												</xsl:if>
											</xsl:for-each>
										</td>
										<td class="annot"/>
										<td class="annot_t"><!--xsl:text>таможня</xsl:text--></td>
									</tr>
									<tr>
										<td class="underline" align="center"><xsl:text>(наименование таможни)</xsl:text></td>
										<td class="annot" colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td align="center" class="annot">
											<xsl:text>№ </xsl:text>
											<u>&#160;&#160;<xsl:apply-templates select="ppg:PermitNumber"/>&#160;&#160;</u>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<xsl:call-template name="Status"/>
							<br/>
							<xsl:call-template name="Applicant">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:Applicant"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;text-align:justify;">
											<xsl:text>2. Документы, подтверждающие право владения, пользования и (или) распоряжения иностранными товарами:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcessingDocuments">
											<xsl:apply-templates select="." mode="doc"/>
											<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>3. Иностранные товары:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcessingGoods"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;text-align:justify;">
											<xsl:text>4. Нормы выхода продуктов переработки, отходов, остатков и производственных потерь в относительном (в процентах) или в абсолютном значении:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="ppg:AppInfomation/ppg:InfoFromApp/ppg:YieldNorm">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;text-align:justify;">
											<xsl:text>5. Продукты переработки:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:PrResult"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>6. Отходы:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:WasteProductsItem"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>6.1. Отходы подлежат помещению под таможенную процедуру:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:value-of select="ppg:WasteProcessingProcedureCode"/>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>7. Остатки:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:Heels"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>8. Производственные потери:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType2">
								<xsl:with-param name="node" select="ppg:AppInfomation/ppg:InfoFromApp/ppg:Loss"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;text-align:justify;">
											<xsl:text>9. Способ (способы) идентификации ввезенных товаров в продуктах их переработки:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:call-template name="IdentificationMethod"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>10. Срок переработки:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="DateLimit"/>
							<br/>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>11. Краткое описание производственного процесса:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcessingOperations">
											<xsl:if test="position() &gt; 1">;<br/></xsl:if>
											<xsl:value-of select="catProc_ru:OperationName"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="catProc_ru:OperationMethod"/>
											<xsl:text>. Срок совершения операции: </xsl:text>
											<xsl:value-of select="catProc_ru:OperationTerm"/>
										</xsl:for-each>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>12.Организация-переработчик (организации-переработчики):</xsl:text>
										</p>
									</td>
								</tr>
								<xsl:choose>
									<xsl:when test="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcOrganization">
										<xsl:for-each select="ppg:AppInfomation/ppg:InfoFromApp/ppg:ProcOrganization">
											<xsl:variable name="pos">
												<xsl:choose>
													<xsl:when test="$cnt_ProcOrganization &gt; 1">
														<xsl:value-of select="position()"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="0"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:variable>
											<xsl:apply-templates select=".">
												<xsl:with-param name="num_pp" select="'12'"/>
												<xsl:with-param name="position" select="$pos"/>
											</xsl:apply-templates>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>	
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="value" align="center"><xsl:text>См. п. 1</xsl:text></td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: 5%;">
											<xsl:text>13. Особые отметки таможни:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:call-template name="CustomsMark"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot">
										<xsl:apply-templates select="ppg:PersonSignature">
											<xsl:with-param name="fio_descr" select="'(Фамилия, имя, отчество (при наличии) начальника таможни (либо лица его замещающего)'"/>
										</xsl:apply-templates>
									</td>
								</tr>
								<tr>
									<td class="underline"> <br/></td>
								</tr>
							</table>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="CustomsMark">
		<xsl:for-each select="ppg:CustomsMark">
			<xsl:if test="ppg:CancelDate">
				<xsl:text>Дата отзыва (аннулирования) разрешения на переработку: </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ppg:CancelDate"/>
				</xsl:call-template>
				<br/>
			</xsl:if>
			<xsl:if test="ppg:RecoveryDate">
				<xsl:text>Дата восстановления разрешения на переработку: </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ppg:RecoveryDate"/>
				</xsl:call-template>
				<br/>
			</xsl:if>
			<xsl:if test="ppg:ReasonDocuments">
				<xsl:text>Реквизиты </xsl:text>
				<xsl:choose>
					<xsl:when test="count(ppg:ReasonDocuments)=1"><xsl:text>документа</xsl:text></xsl:when>
					<xsl:otherwise><xsl:text>документов</xsl:text></xsl:otherwise>
				</xsl:choose>
				<xsl:text>, на основании </xsl:text>
				<xsl:choose>
					<xsl:when test="count(ppg:ReasonDocuments)=1"><xsl:text>которого </xsl:text></xsl:when>
					<xsl:otherwise><xsl:text>которых </xsl:text></xsl:otherwise>
				</xsl:choose>
				<xsl:text>производится </xsl:text>
				<xsl:if test="ppg:CancelDate"><xsl:text>отзыв / аннулирование </xsl:text></xsl:if>
				<xsl:if test="ppg:CancelDate"><xsl:text>восстановление </xsl:text></xsl:if>
				<xsl:text>Разрешения на переработку: </xsl:text>
				<xsl:for-each select="ppg:ReasonDocuments">
					<xsl:apply-templates mode="doc" select="."/>
					<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
				</xsl:for-each>	
				<br/>
			</xsl:if>
			<xsl:if test="ppg:LawDocuments">
				<xsl:choose>
					<xsl:when test="count(ppg:LawDocuments)=1"><xsl:text>Ссылка на правовой акт: </xsl:text></xsl:when>
					<xsl:otherwise><xsl:text>Ссылки на правовые акты: </xsl:text></xsl:otherwise>
				</xsl:choose>
				<xsl:for-each select="ppg:LawDocuments">
					<xsl:apply-templates mode="doc" select="."/>
					<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
				</xsl:for-each>	
				<br/>
			</xsl:if>
			<xsl:if test="ppg:AddInformation">
				<xsl:apply-templates select="ppg:AddInformation"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="*" mode="doc">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="ppg:ArticleNumber">
			<xsl:text>, статья </xsl:text>
			<xsl:value-of select="ppg:ArticleNumber"/>
		</xsl:if>
		<xsl:if test="ppg:PartNumber">
			<xsl:text>, часть </xsl:text>
			<xsl:value-of select="ppg:PartNumber"/>
		</xsl:if>
		<xsl:if test="ppg:ClauseNumber">
			<xsl:text>, пункт </xsl:text>
			<xsl:value-of select="ppg:ClauseNumber"/>
		</xsl:if>
	</xsl:template>
	<!--Способ (способы) идентификации иностранных товаров (товаров ЕАЭС) в продуктах переработки-->
	<xsl:template name="IdentificationMethod">
		<xsl:for-each select="ppg:AppInfomation/ppg:InfoFromApp/ppg:IdentificationMethod">
			<xsl:apply-templates select="catProc_ru:IdentificationMethodDescription"/>
			<xsl:if test="catProc_ru:AccountingSystem">
				<br/>
				<xsl:text>Системы учета: </xsl:text>
				<xsl:apply-templates select="catProc_ru:AccountingSystem"/>
			</xsl:if>
			<xsl:if test="catProc_ru:HeelsItem">
				<br/>
				<xsl:text>Документы: </xsl:text>
				<xsl:for-each select="catProc_ru:HeelsItem">
					<xsl:if test="position() &gt; 1"><xsl:text>; </xsl:text></xsl:if>
					<xsl:apply-templates mode="doc" select="."/>
				</xsl:for-each>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--Срок переработки -->
	<xsl:template name="DateLimit">
		<table class="border">
			<tr class="title">
				<td align="center" width="30%">Срок переработки</td>
				<td align="center" width="35%">Дата начала исчисления срока переработки</td>
				<td align="center" width="35%">Дата окончания срока переработки</td>
			</tr>
			<tr class="title">
				<td align="center">1</td>
				<td align="center">2</td>
				<td align="center">3</td>
			</tr>
			<xsl:for-each select="ppg:DateLimit/ppg:ProcessingTerm">
				<tr class="annot_t">
					<td align="center"><xsl:value-of select="ppg:GeneralTerm"/></td>
					<td align="center">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn"  select="ppg:TermBegin"/>
						</xsl:call-template>
					</td>
					<td align="center">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn"  select="ppg:TermEnd"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<table class="border">
			<tr class="title">
				<td align="center" width="50%">Срок переработки продлен</td>
				<td align="center" width="50%">Дата окончания срока переработки</td>
			</tr>
			<xsl:for-each select="ppg:DateLimit/ppg:ExtensionTerm">
				<tr class="annot_t">
					<td align="center"><xsl:value-of select="ppg:TermExtensionAt"/></td>
					<td align="center">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn"  select="ppg:TermEnd"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!--Таблица с товарами (тип 1 (catProc_ru:ProcessingGoodsType))-->
	<xsl:template name="GoodsTblType1">
		<xsl:param name="node"/>
		<xsl:param name="title_col4" select="'Количество'"/>
		<xsl:param name="title_col6" select="'Таможенный орган'"/>
		<xsl:param name="need_col_sum" select="'1'"/>
		
		<table class="border">
			<tr class="title">
				<td align="center" width="5%">№</td>
				<td align="center" width="35%">Наименование</td>
				<td align="center" width="15%">Код по ТН ВЭД ЕАЭС</td>
				<td align="center" width="15%"><xsl:value-of select="$title_col4"/></td>
				<xsl:if test="$need_col_sum='1'">
					<td align="center" width="15%">Стоимость, руб.</td>
				</xsl:if>	
				<td align="center" width="15%"><xsl:value-of select="$title_col6"/></td>
			</tr>
			<tr class="title">
				<td align="center">1</td>
				<td align="center">2</td>
				<td align="center">3</td>
				<td align="center">4</td>
				<td align="center">5</td>
				<xsl:if test="$need_col_sum='1'">
					<td align="center">6</td>
				</xsl:if>	
			</tr>
			<xsl:for-each select="$node">
				<tr class="annot_t">
					<td align="center"><xsl:value-of select="catProc_ru:GoodsNamber"/></td>
					<td><xsl:apply-templates select="catProc_ru:GoodsDescription"/></td>
					<td><xsl:value-of select="catProc_ru:GoodsTNVEDCode"/></td>
					<td>
						<xsl:if test="catProc_ru:GoodsQuantity">
							<xsl:value-of select="translate(catProc_ru:GoodsQuantity,'.',',')"/>
						</xsl:if>	
						<xsl:if test="catProc_ru:MeasureUnitQualifierName or catProc_ru:MeasureUnitQualifierCode">
							<xsl:text> </xsl:text>
							<xsl:value-of select="catProc_ru:MeasureUnitQualifierName"/>	
							<xsl:if test="catProc_ru:MeasureUnitQualifierName and catProc_ru:MeasureUnitQualifierCode">
								<xsl:text> (</xsl:text>
							</xsl:if>
							<xsl:value-of select="catProc_ru:MeasureUnitQualifierCode"/>	
							<xsl:if test="catProc_ru:MeasureUnitQualifierName and catProc_ru:MeasureUnitQualifierCode">
								<xsl:text>)</xsl:text>
							</xsl:if>
						</xsl:if>
					</td>
					<xsl:if test="$need_col_sum='1'">
						<td>
							<xsl:if test="catProc_ru:GoodsRubCost">
								<xsl:value-of select="translate(translate(format-number(catProc_ru:GoodsRubCost, '#,###.00'),',',' '),'.',',')"/>
							</xsl:if>	
						</td>
					</xsl:if>	
					<td>
						<xsl:for-each select="catProc_ru:CustomsCode">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!--Таблица с товарами (тип 1 (catProc_ru:ProcessingBaseGoodsType))-->
	<xsl:template name="GoodsTblType2">
		<xsl:param name="node"/>
		<xsl:param name="title_col4" select="'Количество'"/>
		<table class="border" width="85%">
			<tr class="title">
				<td align="center" width="5%">№</td>
				<td align="center" width="35%">Наименование</td>
				<td align="center" width="15%">Код по ТН ВЭД ЕАЭС</td>
				<td align="center" width="30%"><xsl:value-of select="$title_col4"/></td>
			</tr>
			<tr class="title">
				<td align="center">1</td>
				<td align="center">2</td>
				<td align="center">3</td>
				<td align="center">4</td>
			</tr>
			<xsl:for-each select="$node">
				<tr class="annot_t">
					<td align="center"><xsl:value-of select="catProc_ru:GoodsNamber"/></td>
					<td><xsl:apply-templates select="catProc_ru:GoodsDescription"/></td>
					<td><xsl:value-of select="catProc_ru:GoodsTNVEDCode"/></td>
					<td>
						<xsl:if test="catProc_ru:GoodsQuantity">
							<xsl:value-of select="translate(catProc_ru:GoodsQuantity,'.',',')"/>
						</xsl:if>	
						<xsl:if test="catProc_ru:MeasureUnitQualifierName or catProc_ru:MeasureUnitQualifierCode">
							<xsl:text> </xsl:text>
							<xsl:value-of select="catProc_ru:MeasureUnitQualifierName"/>	
							<xsl:if test="catProc_ru:MeasureUnitQualifierName and catProc_ru:MeasureUnitQualifierCode">
								<xsl:text> (</xsl:text>
							</xsl:if>
							<xsl:value-of select="catProc_ru:MeasureUnitQualifierCode"/>	
							<xsl:if test="catProc_ru:MeasureUnitQualifierName and catProc_ru:MeasureUnitQualifierCode">
								<xsl:text>)</xsl:text>
							</xsl:if>
						</xsl:if>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!--Замена продуктов переработки эквивалентными товарами (catProc_ru:ProcessingSubstituteGoodsType)-->
	<xsl:template name="Substitute">
		<xsl:param name="node"/>
		<xsl:param name="need_col_5" select="'1'"/>
		<xsl:param name="title_col4" select="'Количество'"/>
		<table class="border">
			<tr class="title">
				<td align="center" width="5%">№</td>
				<td align="center" width="32%">Наименование</td>
				<td align="center" width="15%">Код по ТН ВЭД ЕАЭС</td>
				<td align="center" width="15%"><xsl:value-of select="$title_col4"/></td>
				<xsl:if test="$need_col_5='1'">
					<td align="center" width="33%">Наименование заменяемых продуктов переработки</td>
				</xsl:if>
			</tr>
			<tr class="title">
				<td align="center">1</td>
				<td align="center">2</td>
				<td align="center">3</td>
				<td align="center">4</td>
				<xsl:if test="$need_col_5='1'">
					<td align="center">5</td>
				</xsl:if>
			</tr>
			<xsl:for-each select="$node">
				<tr class="annot_t">
					<td align="center"><xsl:value-of select="catProc_ru:GoodsNamber"/></td>
					<td><xsl:apply-templates select="catProc_ru:GoodsDescription"/></td>
					<td><xsl:value-of select="catProc_ru:GoodsTNVEDCode"/></td>
					<td>
						<xsl:if test="catProc_ru:GoodsQuantity">
							<xsl:value-of select="translate(catProc_ru:GoodsQuantity,'.',',')"/>
						</xsl:if>	
						<xsl:if test="catProc_ru:MeasureUnitQualifierName or catProc_ru:MeasureUnitQualifierCode">
							<xsl:text> </xsl:text>
							<xsl:value-of select="catProc_ru:MeasureUnitQualifierName"/>	
							<xsl:if test="catProc_ru:MeasureUnitQualifierName and catProc_ru:MeasureUnitQualifierCode">
								<xsl:text> (</xsl:text>
							</xsl:if>
							<xsl:value-of select="catProc_ru:MeasureUnitQualifierCode"/>	
							<xsl:if test="catProc_ru:MeasureUnitQualifierName and catProc_ru:MeasureUnitQualifierCode">
								<xsl:text>)</xsl:text>
							</xsl:if>
						</xsl:if>
					</td>
					<xsl:if test="$need_col_5='1'">
						<td>
							<xsl:apply-templates select="catProc_ru:ProcGoodsDescription"/>
							<xsl:if test="catProc_ru:ProcGoodsTNVEDCode">
								<xsl:text> (</xsl:text>
									<xsl:value-of select="catProc_ru:ProcGoodsTNVEDCode"/>
								<xsl:text>)</xsl:text>
							</xsl:if>
						</td>
					</xsl:if>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!--Сведения о статусе документа и операции-->
	<xsl:template name="Status">
		<table>
			<tbody>
				<tr>
					<td width="25%" class="aling">Статус документа:</td>
					<td width="2%" class="aling"/>
					<td width="73%" class="aling">
						<b>
							<xsl:choose>
								<xsl:when test="ppg:DocumentStatus='1'">
									<xsl:text>Подготовлено</xsl:text>
								</xsl:when>
								<xsl:when test="ppg:DocumentStatus='2'">
									<xsl:text>Действует</xsl:text>
								</xsl:when>
								<xsl:when test="ppg:DocumentStatus='3'">
									<xsl:text> Исполнено</xsl:text>
								</xsl:when>
								<xsl:when test="ppg:DocumentStatus='4'">
									<xsl:text>Истек срок действия</xsl:text>
								</xsl:when>
								<xsl:when test="ppg:DocumentStatus='5'">
									<xsl:text>Аннулировано</xsl:text>
								</xsl:when>
								<xsl:when test="ppg:DocumentStatus='6'">
									<xsl:text>Отозвано</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="ppg:DocumentStatus"/>
								</xsl:otherwise>
							</xsl:choose>
						</b>
					</td>
				</tr>
				<tr>
					<td class="aling">Статус операции:</td>
					<td class="aling"/>
					<td class="aling">
						<b>
							<xsl:choose>
								<xsl:when test="ppg:OperationStatus='1'">
									<xsl:text>выдача Разрешения на переработку</xsl:text>
								</xsl:when>
								<xsl:when test="ppg:OperationStatus='2'">
									<xsl:text>отзыв Разрешения</xsl:text>
								</xsl:when>
								<xsl:when test="ppg:OperationStatus='3'">
									<xsl:text>аннулирование Разрешения</xsl:text>
								</xsl:when>
								<xsl:when test="ppg:OperationStatus='4'">
									<xsl:text>восстановление Разрешения</xsl:text>
								</xsl:when>
								<xsl:when test="ppg:OperationStatus='5'">
									<xsl:text>разрешение на передачу Разрешения на переработку иному лицу</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="ppg:OperationStatus"/>
								</xsl:otherwise>
							</xsl:choose>
						</b>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!--Сведения о Заявителе-->
	<xsl:template name="Applicant">
		<xsl:param name="node"/>
		<xsl:param name="isRecipient" select="'0'"/>
		<xsl:param name="place_name" select="'Адрес местонахождения: '"/>
		<table>
			<xsl:choose>
				<xsl:when test="$isRecipient='0'">
					<tr>
						<td class="annot_t">
							<p style="text-indent: 5%;">
								<xsl:text>1. Выдано:</xsl:text>
							</p>
						</td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td class="annot_t">
							<p style="text-indent: 5%;">
								<xsl:text>1.1 Передано:</xsl:text>
							</p>
						</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
		<xsl:for-each select="$node">
			<table>
				<tr>
					<td class="value">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:ShortName">
							<xsl:if test="cat_ru:OrganizationName">
								<xsl:text> (</xsl:text>
							</xsl:if>
							<xsl:value-of select="cat_ru:ShortName"/>
							<xsl:if test="cat_ru:OrganizationName">
								<xsl:text>)</xsl:text>
							</xsl:if>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<xsl:choose>
						<xsl:when test="$isRecipient='0'">
							<td class="underline" align="center">
								<xsl:text>(полное и сокращенное наименование заявителя)</xsl:text>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td class="underline" align="center">
								<xsl:text>(полное и сокращенное наименование лица)</xsl:text>
							</td>
						</xsl:otherwise>
					</xsl:choose>
				</tr>
				<tr>
					<td class="annot">
						<table>
							<tr>
								<td class="annot" width="70%"><xsl:text>Идентификационный номер налогоплательщика (далее - ИНН): </xsl:text></td>
								<td class="value" width="30%"><xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/></td>
							</tr>
							<tr>
								<td class="annot"><xsl:text>Код причины постановки на учет (далее - КПП): </xsl:text></td>
								<td class="value"><xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/></td>
							</tr>
							<tr>
								<td class="annot"><xsl:text>Основной государственный регистрационный номер (далее - ОГРН): </xsl:text></td>
								<td class="value"><xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="annot">
						<xsl:text>Юридический адрес: </xsl:text>
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:for-each select="RUScat_ru:SubjectAddressDetails[not(RUScat_ru:AddressKindCode) or RUScat_ru:AddressKindCode='1']">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
						</xsl:for-each>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="annot">
						<xsl:text>Почтовый адрес: </xsl:text>
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:for-each select="RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='3']">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
						</xsl:for-each>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="annot">
						<xsl:value-of select="$place_name"/>
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:for-each select="RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='2']">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
						</xsl:for-each>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="annot">
						<xsl:text>Адрес электронной почты, номер (номера) телефона (телефонов), факс, телекс: </xsl:text>
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:for-each select="RUScat_ru:CommunicationDetails">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
						</xsl:for-each>
						<br/>
					</td>
				</tr>
				<xsl:choose>
					<xsl:when test="ppg:BankReqInfo">
						<xsl:for-each select="ppg:BankReqInfo">
							<tr>
								<td class="annot">
									<xsl:text>Наименование банка: </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:value-of select="cat_ru:OrganizationName"/>
									<xsl:if test="cat_ru:ShortName">
										<xsl:if test="cat_ru:OrganizationName">
											<xsl:text> (</xsl:text>
										</xsl:if>
										<xsl:value-of select="cat_ru:ShortName"/>
										<xsl:if test="cat_ru:OrganizationName">
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:if>
									<xsl:if test="catProc_ru:BankMFO">
										<xsl:text>, МФО: </xsl:text>
										<xsl:value-of select="catProc_ru:BankMFO"/>
									</xsl:if>
									<xsl:if test="catProc_ru:OKPOID">
										<xsl:text>, ОКПО: </xsl:text>
										<xsl:value-of select="catProc_ru:OKPOID"/>
									</xsl:if>
									<xsl:if test="catProc_ru:BICID">
										<xsl:text>, БИК: </xsl:text>
										<xsl:value-of select="catProc_ru:BICID"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="underline" align="center">
									<xsl:text>(полное и сокращенное наименование)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="annot">
									<table>
										<tr>
											<td class="annot" width="20%"><xsl:text>ИНН: </xsl:text></td>
											<td class="value" width="80%"><xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/></td>
										</tr>
										<tr>
											<td class="annot"><xsl:text>КПП: </xsl:text></td>
											<td class="value"><xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/></td>
										</tr>
										<tr>
											<td class="annot"><xsl:text>ОГРН: </xsl:text></td>
											<td class="value"><xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td class="annot">
									<xsl:text>Рублевый счет  (счета): </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="catProc_ru:BankAccountRUB">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="annot">
									<xsl:text>Валютный счет (счета): </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="catProc_ru:BankAccountVAL">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td class="annot">
								<xsl:text>Наименование банка (банков): </xsl:text>
							</td>
						</tr>
						<tr>
							<td class="value"><br/> </td>
						</tr>
						<tr>
							<td class="underline" align="center">
								<xsl:text>(полное и сокращенное наименование)</xsl:text>
							</td>
						</tr>
						<tr>
							<td class="annot">
								<table>
									<tr>
										<td class="annot" width="20%"><xsl:text>ИНН: </xsl:text></td>
										<td class="value" width="80%"><br/> </td>
									</tr>
									<tr>
										<td class="annot"><xsl:text>КПП: </xsl:text></td>
										<td class="value"><br/> </td>
									</tr>
									<tr>
										<td class="annot"><xsl:text>ОГРН: </xsl:text></td>
										<td class="value"><br/> </td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="annot">
								<xsl:text>Рублевый счет  (счета): </xsl:text>
							</td>
						</tr>
						<tr>
							<td class="value"><br/> </td>
						</tr>
						<tr>
							<td class="annot">
								<xsl:text>Валютный счет (счета): </xsl:text>
							</td>
						</tr>
						<tr>
							<td class="value"><br/> </td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="ppg:ProcessingProcedureCode='51'">
					<tr>
						<td class="annot">
							<xsl:text>Адрес местонахождения производственных мощностей: </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="value">
							<xsl:for-each select="ppg:FactoryPlace">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
							</xsl:for-each>
							<br/>
						</td>
					</tr>
				</xsl:if>
			</table>
		</xsl:for-each>
	</xsl:template>

	<!-- Шаблон для типа catProc_ru:ProcessingOrganizationType -->
	<xsl:template match=" ppg:ProcOrganization">
		<xsl:param name="num_pp" select="'0'"/>
		<xsl:param name="position" select="'0'"/>
		
		<xsl:variable name="npp">
			<xsl:choose>
				<xsl:when test="$position!='0' and $num_pp!='0'">
					<xsl:value-of select="$num_pp"/>
					<xsl:text>(</xsl:text>
					<xsl:value-of select="$position"/>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="$position='0' and $num_pp!='0'">
					<xsl:value-of select="$num_pp"/>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise>
			</xsl:choose>
		
		</xsl:variable>
		<xsl:if test="$position!='0'">
			<table>
				<tr>
					<td class="annot">
						<p style="text-indent: 5%;">
							<xsl:value-of select="$npp"/>
						</p>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table>
			<tr>
				<td class="value">
					<xsl:value-of select="cat_ru:OrganizationName"/>
					<xsl:if test="cat_ru:ShortName">
						<xsl:if test="cat_ru:OrganizationName">
							<xsl:text> (</xsl:text>
						</xsl:if>
						<xsl:value-of select="cat_ru:ShortName"/>
						<xsl:if test="cat_ru:OrganizationName">
							<xsl:text>)</xsl:text>
						</xsl:if>
					</xsl:if>
					<xsl:if test="(cat_ru:OrganizationName or cat_ru:ShortName) and cat_ru:RFOrganizationFeatures">
						<xsl:text>, </xsl:text>
					</xsl:if>
					<xsl:for-each select="cat_ru:RFOrganizationFeatures">
						<xsl:for-each select="*">
							<xsl:choose>
								<xsl:when test="local-name()='INN'">ИНН: </xsl:when>
								<xsl:when test="local-name()='KPP'">КПП: </xsl:when>
								<xsl:when test="local-name()='OGRN'">ОГРН: </xsl:when>
							</xsl:choose>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<td class="underline" align="center">
					<xsl:text>(полное и сокращенное наименование, ИНН)</xsl:text>
				</td>
			</tr>
			<tr>
				<td class="annot">
					<xsl:text>Юридический адрес: </xsl:text>
				</td>
			</tr>
			<tr>
				<td class="value">
					<xsl:for-each select="catProc_ru:Address">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
					</xsl:for-each>
					<br/>
				</td>
			</tr>
			<!--tr>
				<td class="annot">
					<xsl:text>Почтовый адрес и адрес местонахождения: </xsl:text>
				</td>
			</tr>
			<tr>
				<td class="value">
					<br/>
				</td>
			</tr-->
			<tr>
				<td class="annot">
					<xsl:text>Адрес электронной почты, номер (номера) телефона (телефонов), факс, телекс: </xsl:text>
				</td>
			</tr>
			<tr>
				<td class="value">
					<xsl:for-each select="catProc_ru:Contact">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
					</xsl:for-each>
					<br/>
				</td>
			</tr>
			<tr>
				<td class="annot">
					<xsl:text>Адрес местонахождения производственных мощностей: </xsl:text>
				</td>
			</tr>
			<tr>
				<td class="value">
					<xsl:for-each select="catProc_ru:FactoryPlace">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
					</xsl:for-each>
					<br/>
				</td>
			</tr>
		</table>
		<br/>
		<table>
			<tr>
				<td class="annot_t">
					<p style="text-indent: 5%;">
						<xsl:value-of select="$npp"/>
						<xsl:text>.1 Товары, передаваемые на переработку:</xsl:text>
					</p>
				</td>
			</tr>
		</table>
		<br/>
		<xsl:call-template name="GoodsTblType1">
			<xsl:with-param name="node" select="catProc_ru:ProcessingGoods"/>
			<xsl:with-param name="need_col_sum" select="'0'"/>
		</xsl:call-template>
		<br/>
		<table>
			<tr>
				<td class="annot_t">
					<p style="text-indent: 5%;text-align:justify">
						<xsl:value-of select="$npp"/>
						<xsl:text>.2 Документ (документы), в соответствии с которым иностранные товары, помещенные под таможенную процедуру переработки </xsl:text>
						<xsl:choose>
							<xsl:when test="ppg:ProcessingProcedureCode='51'">
								<xsl:text>.2 Документ (документы), в соответствии с которым иностранные товары, помещенные под таможенную процедуру переработки </xsl:text>
								<xsl:text>на таможенной территории, передаются от заявителя организации-переработчику для совершения операций по их переработке:</xsl:text>
							</xsl:when>
							<xsl:when test="ppg:ProcessingProcedureCode='91'">
								<xsl:text>.2 Документ (документы), в соответствии с которым иностранные товары, помещенные под таможенную процедуру переработки </xsl:text>
								<xsl:text>для внутреннего потребления, передаются от заявителя организации-переработчику для совершения операций по их переработке:</xsl:text>
							</xsl:when>
						</xsl:choose>
					</p>
				</td>
			</tr>
			<tr>
				<td class="value">
					<xsl:for-each select="catProc_ru:Contract">
						<xsl:apply-templates select="." mode="doc"/>
						<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
					</xsl:for-each>
					<br/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- cat_ru:PersonSignatureType -->
	<xsl:template match="ppg:PersonSignature">
		<xsl:param name="fio_descr" select="''"/>
		<table>
			<tbody>
				<tr>
					<td class="value" width="50%" align="center">
						<xsl:if test="cat_ru:PersonPost">
							<xsl:value-of select="cat_ru:PersonPost"/>
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:if test="cat_ru:PersonMiddleName">
							<xsl:text> </xsl:text>
							<xsl:value-of select="cat_ru:PersonMiddleName"/>
						</xsl:if>
					</td>
					<td class="annot" width="3%"/>
					<td class="value" width="24%"/>
					<td class="annot" width="3%"/>
					<td class="value" width="20%" align="center">
						<xsl:if test="cat_ru:IssueDate">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="underline" align="center">
						<xsl:value-of select="$fio_descr"/>
					</td>
					<td class="underline"/>
					<td class="underline" align="center">
						<xsl:text>(подпись)</xsl:text>
					</td>
					<td class="underline"/>
					<td class="underline" align="center">
						<xsl:text>(дата)</xsl:text>
					</td>
				</tr>
				<tr>
					<td class="underline" colspan="5"> <br/></td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails|catProc_ru:Contact">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType или cat_ru:AddressType-->
	<xsl:template match="RUScat_ru:SubjectAddressDetails | catProc_ru:Address | catProc_ru:FactoryPlace">
		<xsl:for-each select="*">
			<xsl:if test="local-name()='AddressKindCode'">Код вида адреса: </xsl:if>
			<xsl:if test="local-name()='PostalCode'">Почтовый индекс: </xsl:if>
			<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
			<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
			<xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
			<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
			<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if>
			<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
			<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='CountryCode'">
					<xsl:if test="not(../RUScat_ru:CounryName) and not(../cat_ru:CounryName)">
						<xsl:value-of select="."/>
					</xsl:if>	
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
					<xsl:if test="local-name()='CounryName'">
						<xsl:if test="../RUScat_ru:CountryCode"> (<xsl:value-of select="../RUScat_ru:CountryCode"/>)</xsl:if>
						<xsl:if test="../cat_ru:CountryCode"> (<xsl:value-of select="../cat_ru:CountryCode"/>)</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:if test="local-name()!='CountryCode' or (local-name()='CountryCode' and not(../RUScat_ru:CounryName) and not(../cat_ru:CounryName))">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catProc_ru:PermitNumberType -->
	<xsl:template match="ppg:PermitNumber">
		<xsl:value-of select="catProc_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="catProc_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="catProc_ru:ProcessingProcedureCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="catProc_ru:Number"/>
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
</xsl:stylesheet>
