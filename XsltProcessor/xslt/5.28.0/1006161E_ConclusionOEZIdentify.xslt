<?xml version="1.0" encoding="utf-8"?>
<!--  Приказ ФТС России от 26.03.2012 № 566 "Об утверждении Порядка и технологий совершения таможенных операций в отношении товаров, включая транспортные средства, ввозимых (ввезенных) на территории особых экономических зон и вывозимых с территорий особых экономических зон, и порядка идентификации"
Приложение №4 - conid:DocSign='1'
Приказ Минфина России от 10.03.2016 № 22н "Об утверждении Порядка проведения таможенными органами идентификации иностранных товаров, помещаемых (помещенных) под таможенную процедуру свободной таможенной зоны, в товарах, изготовленных (полученных) с использованием иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны"
Приложение №2 - conid:DocSign='2', conid:Conclusion='true' or conid:Conclusion='t' or conid:Conclusion='1'
Приложение №3 - conid:DocSign='2', conid:Conclusion='false' or conid:Conclusion='f' or conid:Conclusion='0'  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:conid="urn:customs.ru:Information:CustomsDocuments:ConclusionOEZIdentify:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ConclusionOEZIdentifyType -->
	<xsl:template match="conid:ConclusionOEZIdentify">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					body {
					background: #cccccc;
					}

					div.page {
					width: 277mm;
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

					table.border tr td
					{
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					}

					div.title, tr.title td { font-weight:bold;  }
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

					.graphLittle
					{
					font-family: Arial;
					font-size: 7pt;
					}

					.descr{
					font-size: 8pt;
					text-align: center;
					vertical-align:top;
					}
				</style>
			</head>
			<body>
				<!--xsl:if test="conid:DocSign='1'">
					<div class="page" style="font-family:Arial;">
						<table>
							<tbody>
								<tr>
									<td width="40%" style="border-bottom:1px solid;">
										<table>
											<tbody>
												<tr>
													<td>Регистрационный номер</td>
													<td align="center"><xsl:value-of select="conid:RegistrationNumber/conid:Number"/></td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="20%"></td>
									<td width="40%"></td>
								</tr>
								<tr>
									<td width="40%" style="border-bottom:1px solid;">
										<table>
											<tbody>
												<tr>
													<td>Дата выдачи</td>
													<td align="center">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="conid:RegistrationNumber/conid:RegistrationDate"/>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="20%"></td>
									<td align="center" width="40%" style="border-bottom:1px solid;">
										<xsl:value-of select="conid:Customs/cat_ru:OfficeName"/> (<xsl:value-of select="conid:Customs/cat_ru:Code"/>)
									</td>
								</tr>
								<tr valign="top" align="center" class="graphLittle">
									<td width="40%"></td>
									<td width="20%"></td>
									<td width="40%">
										(наименование и код таможенного органа (с указанием кода таможенного органа))
									</td>
								</tr>
							</tbody>
						</table>
						<br/><br/>
						<table width="100%">
							<tbody>
								<tr>
									<td align="center">
										<b>
											ЗАКЛЮЧЕНИЕ
											<br/>о приемлемости заявляемого способа идентификации
											<br/>(о возможности идентификации ввозимых товаров)
										</b>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<br/>
										Рассмотрев на основании заявления № 
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="регистрационный номер"/>
												<xsl:if test="дата регистрации">
													<xsl:text> от </xsl:text>
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="дата регистрации"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="descr" select="'(регистрационный номер, дата регистрации)'"/>
											<xsl:with-param name="width" select="'37mm'"/>
										</xsl:call-template>
										<xsl:text>&#160;документы </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="наименование (фио) заявителя"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="descr" select="'(наименование (Ф.И.О.) заявителя)'"/>
											<xsl:with-param name="width" select="'50mm'"/>
										</xsl:call-template>
										<xsl:text>&#160;по вопросу о приемлемости заявленного заявителем способа идентификации ввезенных товаров в товарах, изготовленных (полученных) на территории ОЭЗ (либо о возможности идентификации ввозимых (ввезенных) товаров), сообщаем, что в отношении товаров</xsl:text>
										<br/>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="наименования товаров"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="descr" select="'(наименования товаров)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<br/>
										<u>
											<xsl:choose>
												<xsl:when test="индикатор=0">не имеется</xsl:when>
												<xsl:when test="индикатор=1">имеется</xsl:when>
											</xsl:choose>
										</u>
										<xsl:text>&#160;возможность </xsl:text>
										<xsl:choose>
											<xsl:when test="наименования товаров, изготовленных на территории ОЭЗ">
												<xsl:text>их идентификации в товарах</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:apply-templates select="наименования товаров, изготовленных на территории ОЭЗ"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="descr" select="'(наименования товаров, изготовленных на территории ОЭЗ)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
												<br/>
											</xsl:when>
											<xsl:otherwise>идентификации </xsl:otherwise>
										</xsl:choose>
										<xsl:text>с применением</xsl:text>
										<br/>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:for-each select="conid:MethodIdentify">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="descr" select="'(способ идентификации или описание средства идентификации)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<br/>
										<xsl:text>при соблюдении следующих условий:</xsl:text>
										<br/>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="действия должностных лиц уполномоченного таможенного органа при проведении идентификации ввезенных товаров в товарах, изготовленных на территории ОЭЗ"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="descr" select="'(действия должностных лиц уполномоченного таможенного органа при проведении идентификации ввезенных товаров в товарах, изготовленных на территории ОЭЗ)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<br/>
										<br/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table style="font-family:Arial;width:190mm;">
							<tbody>
								<tr>
									<td align="center" style="border-bottom:1px solid;" width="30%">Начальник таможенного органа</td>
									<td width="15%"></td>
									<td style="border-bottom:1px solid;" width="15%"></td>
									<td width="15%"></td>
									<td width="30%" align="center"><xsl:value-of select="conid:CustomsPerson/cat_ru:PersonName"/></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td style="font-size:8pt" align="center">(подпись)</td>
									<td></td>
									<td style="font-size:8pt" align="center">(Ф.И.О.)</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td align="center"><xsl:value-of select="conid:CustomsPerson/cat_ru:LNP"/><xsl:if test="conid:CustomsPerson/cat_ru:CustomsCode"> (код ТО: <xsl:value-of select="conid:CustomsPerson/cat_ru:CustomsCode"/>)</xsl:if></td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<hr/>
						<br/>
						<br/>
						<table style="font-family:Arial;width:190mm;">
							<tbody>
								<tr>
									<td align="center" style="border-bottom:1px solid;" width="30%">
										<xsl:value-of select="инициалы и фамилия представителя лица, получившего заключение"/>
									</td>
									<td width="15%"></td>
									<td width="15%" align="center">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="дата получения заключения"/>
										</xsl:call-template>
									</td>
									<td width="15%"></td>
									<td width="15%" align="center"></td>
								</tr>
								<tr>
									<td style="font-size:8pt" align="center">(инициалы и фамилия представителя лица, получившего заключение)</td>
									<td></td>
									<td style="font-size:8pt" align="center">(дата получения заключения)</td>
									<td></td>
									<td style="font-size:8pt" align="center">(подпись)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if-->
				<xsl:if test="conid:DocSign='2'">
					<div class="page" style="font-family:Arial;">
						<table>
							<tbody>
								<tr align="center">
									<td width="30%" style="border-bottom:1px solid;">
										<xsl:value-of select="conid:Customs/cat_ru:OfficeName"/>
									</td>
									<td width="40%"></td>
									<td width="30%" style="border-bottom:1px solid;">
										<xsl:value-of select="conid:OEZ_Resident/cat_ru:OrganizationName"/>
									</td>
								</tr>
								<tr valign="top" align="center" class="graphLittle">
									<td width="30%">
										(наименование таможенного органа)
									</td>
									<td width="40%"></td>
									<td width="30%">
										(наименование заявителя или лица, действующего по его поручению и от его имени)
									</td>
								</tr>
							</tbody>
						</table>
						<br/><br/>
						<table width="100%">
							<tbody>
								<tr>
									<td align="center">
										<b>
											ЗАКЛЮЧЕНИЕ
											<br/>о 
											<xsl:if test="conid:Conclusion='false' or conid:Conclusion='f' or conid:Conclusion='0'">не</xsl:if>возможности идентификации иностранных товаров,<br/>
											помещаемых (помещенных) под таможенную процедуру СТЗ, в готовой продукции
										</b>
										<br/>
										<br/>
										от <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="conid:RegistrationNumber/conid:RegistrationDate"/></xsl:call-template><xsl:text> № </xsl:text><xsl:value-of select="conid:RegistrationNumber/conid:Number"/>
										<xsl:value-of select="conid:RegistrationNumber/conid:AbbrDoc"/>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<br/>
										Рассмотрев Заявление об идентификации иностранных товаров, помещаемых (помещенных) под таможенную процедуру свободной таможенной зоны, в готовой продукции № 
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="conid:RegistrationNumberImp/conid:Number"/>
												<!--xsl:if test="conid:RegistrationNumberImp/conid:RegistrationDate">
												<xsl:text> от </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="conid:RegistrationNumberImp/conid:RegistrationDate"/>
												</xsl:call-template>
												</xsl:if-->
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="descr" select="'(регистрационный номер Заявления)'"/>
											<xsl:with-param name="width" select="'37mm'"/>
										</xsl:call-template>
										<xsl:text>&#160;сообщаем</xsl:text>
										<xsl:if test="conid:Conclusion='true' or conid:Conclusion='t' or conid:Conclusion='1'">
											<xsl:text> о возможности идентификации иностранных товаров (таблица № 1) в готовой продукции (таблица № 2) с применением следующего(их) способа(ов) идентификации:</xsl:text>
											<br/>
											<xsl:for-each select="conid:MethodIdentify">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">, </xsl:if>
											</xsl:for-each>
											<br/>
											<br/>
											Таблица №1
											<table style="width:100%;border:1px solid;">
												<tbody>
													<tr>
														<td colspan="5" align="center" style="border:1px solid;">Сведения о товарах</td>
													</tr>
													<tr align="center" valign="top">
														<td style="border:1px solid;">наименование товара</td>
														<td style="border:1px solid;">код товара</td>
														<td style="border:1px solid;">идентификационные признаки товара</td>
														<td style="border:1px solid;">регистрационный номер ДТ/порядковый номер(а) товара</td>
														<td style="border:1px solid;">количество товара / единицы измерения (основная и дополнительная)</td>
													</tr>
													<tr>
														<td align="center" style="border:1px solid;">1</td>
														<td align="center" style="border:1px solid;">2</td>
														<td align="center" style="border:1px solid;">3</td>
														<td align="center" style="border:1px solid;">4</td>
														<td align="center" style="border:1px solid;">5</td>
													</tr>
													<xsl:for-each select="conid:GoodsInfo">
														<tr valign="top">
															<td style="border:1px solid;">
																<xsl:apply-templates select="conid:GoodsDescription"/>
															</td>
															<td style="border:1px solid;">
																<xsl:choose>
																	<xsl:when test="conid:DocSign='1'"><xsl:value-of select="substring(conid:GoodsTNVEDCode,1,6)"/></xsl:when>
																	<xsl:otherwise><xsl:value-of select="conid:GoodsTNVEDCode"/></xsl:otherwise>
																</xsl:choose>
															</td>
															<td style="border:1px solid;">
																<xsl:for-each select="conid:GoodsGroupInformation">
																	<xsl:for-each select="*">
																		<xsl:choose>
																			<xsl:when test="contains(local-name(.),'Date')">
																				<xsl:call-template name="russian_date">
																					<xsl:with-param name="dateIn" select="."/>
																				</xsl:call-template>
																			</xsl:when>
																			<xsl:when test="local-name(.)='WoodDescriptionDetails'">
																				<xsl:apply-templates mode="WoodDescriptionDetails" select="."/>
																			</xsl:when>
																			<xsl:when test="local-name()='Dimensions'">
																				<xsl:apply-templates mode="Dimensions" select="."/>
																			</xsl:when>
																			<xsl:when test="local-name()='GoodsGroupQuantity'">
																				<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
																			</xsl:when>
																			<xsl:when test="local-name()='LicenseGroup'">
																				<xsl:if test="not(preceding-sibling::*[local-name()='LicenseGroup'])">
																					<!--для unbounted элемента LicenseGroup выведем сразу все, как только всетретили первый-->
																					<xsl:for-each select="../*[local-name()='LicenseGroup']">
																						<xsl:if test="position()=1"><xsl:text>Сведения о разрешительном документе к товарной группе: </xsl:text></xsl:if>
																						<xsl:if test="position()!=1"><xsl:text>; </xsl:text></xsl:if>
																						<xsl:apply-templates select="."/>
																					</xsl:for-each>
																				</xsl:if>
																			</xsl:when>
																			<xsl:otherwise>
																				<xsl:apply-templates select="."/>
																			</xsl:otherwise>
																		</xsl:choose>
																		<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
																	</xsl:for-each>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
															<td style="border:1px solid;">
																<xsl:for-each select="conid:NumberDT">
																	<xsl:value-of select="cat_ru:CustomsCode"/>
																	<xsl:text>/</xsl:text>
																	<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
																	</xsl:call-template>
																	<xsl:text>/</xsl:text>
																	<xsl:value-of select="cat_ru:GTDNumber"/>
																</xsl:for-each>
																<xsl:if test="conid:GoodsNumeric">
																	<xsl:text> / </xsl:text>
																	<xsl:value-of select="conid:GoodsNumeric"/>
																</xsl:if>
															</td>
															<td style="border:1px solid;">
																<xsl:for-each select="conid:GoodsQuantity">
																	<xsl:for-each select="*">
																		<xsl:if test="local-name(.)='MeasureUnitQualifierCode'">(</xsl:if>
																		<xsl:value-of select="."/>
																		<xsl:if test="local-name(.)='MeasureUnitQualifierCode'">)</xsl:if>
																		<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
																	</xsl:for-each>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
											<br/>
											Таблица № 2
											<table style="width:100%;border:1px solid;">
												<tbody>
													<tr>
														<td colspan="4" align="center" style="border:1px solid;">Сведения о готовой продукции</td>
													</tr>
													<tr align="center" valign="top">
														<td style="border:1px solid;">наименование товара</td>
														<td style="border:1px solid;">код товара по ТН ВЭД ЕАЭС</td>
														<td style="border:1px solid;">идентификационные признаки товара</td>
														<td style="border:1px solid;">количество товара / единицы измерения (основная и дополнительная)</td>
													</tr>
													<tr>
														<td align="center" style="border:1px solid;">1</td>
														<td align="center" style="border:1px solid;">2</td>
														<td align="center" style="border:1px solid;">3</td>
														<td align="center" style="border:1px solid;">4</td>
													</tr>
													<xsl:for-each select="conid:GoodsOut">
														<tr valign="top">
															<td style="border:1px solid;">
																<xsl:apply-templates select="conid:GoodsDescription"/>
															</td>
															<td style="border:1px solid;">
																<xsl:choose>
																	<xsl:when test="conid:DocSign='1'"><xsl:value-of select="substring(conid:GoodsTNVEDCode,1,6)"/></xsl:when>
																	<xsl:otherwise><xsl:value-of select="conid:GoodsTNVEDCode"/></xsl:otherwise>
																</xsl:choose>
															</td>
															<td style="border:1px solid;">
																<xsl:for-each select="conid:GoodsGroupInformation">
																	<xsl:for-each select="*">
																		<xsl:choose>
																			<xsl:when test="contains(local-name(.),'Date')">
																				<xsl:call-template name="russian_date">
																					<xsl:with-param name="dateIn" select="."/>
																				</xsl:call-template>
																			</xsl:when>
																			<xsl:when test="local-name(.)='WoodDescriptionDetails'">
																				<xsl:apply-templates mode="WoodDescriptionDetails" select="."/>
																			</xsl:when>
																			<xsl:when test="local-name()='Dimensions'">
																				<xsl:apply-templates mode="Dimensions" select="."/>
																			</xsl:when>
																			<xsl:when test="local-name()='GoodsGroupQuantity'">
																				<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
																			</xsl:when>
																			<xsl:when test="local-name()='LicenseGroup'">
																				<xsl:if test="not(preceding-sibling::*[local-name()='LicenseGroup'])">
																					<xsl:if test="position()!=1"><xsl:text>; </xsl:text></xsl:if>
																					<xsl:if test="position()=1"><xsl:text>Сведения о разрешительном документе к товарной группе: </xsl:text></xsl:if>
																					<!--для unbounted элемента LicenseGroup выведем сразу все, как только всетретили первый-->
																					<xsl:for-each select="../*[local-name()='LicenseGroup']">
																						<xsl:apply-templates select="."/>
																					</xsl:for-each>
																				</xsl:if>
																			</xsl:when>
																			<xsl:otherwise>
																				<xsl:apply-templates select="."/>
																			</xsl:otherwise>
																		</xsl:choose>
																		<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
																	</xsl:for-each>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
															<td style="border:1px solid;">
																<xsl:for-each select="conid:GoodsQuantity">
																	<xsl:for-each select="*">
																		<xsl:if test="local-name(.)='MeasureUnitQualifierCode'">(</xsl:if>
																		<xsl:value-of select="."/>
																		<xsl:if test="local-name(.)='MeasureUnitQualifierCode'">)</xsl:if>
																		<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
																	</xsl:for-each>
																	<xsl:if test="position()!=last()"><br/></xsl:if>
																</xsl:for-each>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</xsl:if>
										<xsl:if test="conid:Conclusion='false' or conid:Conclusion='f' or conid:Conclusion='0'">
											<xsl:text>, что идентификация иностранных товаров в готовой продукции, согласно Заявлению, не возможна в связи со следующим:</xsl:text>
											<br/>
											<xsl:apply-templates select="conid:Reason"/>
											<br/>
											<br/>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table style="font-family:Arial;width:190mm;">
							<tbody>
								<tr>
									<td align="center" style="border-bottom:1px solid;" width="30%">
										<xsl:value-of select="conid:CustomsPerson/cat_ru:PersonName"/>
									</td>
									<td width="15%"></td>
									<td style="border-bottom:1px solid;" width="15%"></td>
									<td width="15%"></td>
									<td width="15%" align="center"><xsl:value-of select="conid:CustomsPerson/cat_ru:LNP"/><xsl:if test="conid:CustomsPerson/cat_ru:CustomsCode"> (код ТО: <xsl:value-of select="conid:CustomsPerson/cat_ru:CustomsCode"/>)</xsl:if></td>
								</tr>
								<tr>
									<td style="font-size:8pt" align="center">(<!--должность, -->инициалы и фамилия уполномоченного должностного лица таможенного органа)</td>
									<td></td>
									<td style="font-size:8pt" align="center">(подпись)</td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="descr"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="comma" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$descr"/>
					</td>
					<xsl:if test="$comma != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:WoodDescriptionDetailsType -->
	<xsl:template  mode="WoodDescriptionDetails" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
				<xsl:if test="local-name()='WoodSortiment'">
					<xsl:text>Наим.сортимента: </xsl:text>
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="local-name()='WoodKind'">
					<xsl:text>Порода древесины: </xsl:text>
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="local-name()='ProductSortName'">
					<xsl:text>Наименование сорта:</xsl:text>
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="local-name()='AllowanceDetails'">
					<xsl:text>Припуск по длине, ширине, высоте: </xsl:text>
					<xsl:apply-templates mode="Dimensions" select="."/>
				</xsl:if>
				<xsl:if test="local-name()='DeviationDetails'">
					<xsl:text>Отклонения по длине, ширине, высоте: </xsl:text>
					<xsl:apply-templates mode="Dimensions" select="."/>
				</xsl:if>
				<xsl:if test="local-name()='catESAD_cu:DiameterRangeDetails'">
					<xsl:text>Диапазон диаметров: </xsl:text>
					<xsl:apply-templates mode="Dimensions" select=".">
						<xsl:with-param name="separator" select="'-'"/>
					</xsl:apply-templates>
				</xsl:if>
				<xsl:if test="local-name()='ContractVolumeMeasure'">
					<xsl:text> Объем товара в соответствии с контрактом: </xsl:text>
					<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
				</xsl:if>
				<xsl:if test="local-name()='FactVolumeMeasure'">
					<xsl:text> Фактический объем товара: </xsl:text>
					<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
				</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:DimensionType и catESAD_cu:RangeMeasureType-->
	<xsl:template mode="Dimensions" match="*">
		<xsl:param name="separator" select="'x'"/>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="$separator"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_cu:SupplementaryQuantityType и catESAD_cu:UnifiedPhysicalMeasureType-->
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='MeasureUnitQualifierCode'">
					<xsl:text>(</xsl:text><xsl:value-of select="."/><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:LicenseGroupType-->	
	<xsl:template match="catESAD_cu:LicenseGroup">
		<xsl:if test="catESAD_cu:LicDocument">
			<xsl:apply-templates select="catESAD_cu:LicDocument"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsNumericLic">
			<xsl:if test="catESAD_cu:LicDocument">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:text>№ п/п товара: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsNumericLic"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="catESAD_cu:LicDocument">
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
