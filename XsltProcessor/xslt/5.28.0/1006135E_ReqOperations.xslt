<?xml version="1.0" encoding="UTF-8"?>
<!-- Требование (DocSign = 0) - Приказ ФТС России от 25 октября 2011 года № 2199, Приложение 4 (ссылка на 311-ФЗ заменена на 289-ФЗ на основании письма от Aistm-Softland <aistm@tamga-group.ru> 24.12.2019 10:29, тема: Редактирование xslt) -->
<!-- Приказ ФТС России от 7 декабря 2020 г. N 1067 Приложение N 4 (Требование о проведении грузовых и иных операций в отношении товаров и транспортных средств)-->
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:reqop="urn:customs.ru:Information:CustomsDocuments:ReqOperations:5.28.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="gtd"/>
		<xsl:choose>
			<xsl:when test="substring($gtd,5,1)='-' and substring($gtd,8,1)='-'">
				<xsl:value-of select="substring($gtd,9,2)"/>
				<xsl:value-of select="substring($gtd,6,2)"/>
				<xsl:value-of select="substring($gtd,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$gtd"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="reqop:ReqOperations">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>
					<xsl:if test="reqop:DocSign='1'">Заявление</xsl:if>
					<xsl:if test="reqop:DocSign='0'">Требование</xsl:if> о проведении грузовых и иных операций в отношении товаров и транспортных средств</title>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Arial;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 13pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						
						.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph14Bold {
						font-family: Arial;
						font-size: 14pt;
						font-weight: bold;
						}				
						.bordered {
					border-bottom: solid 1pt #000000;
										}	
						.uplined {
					border-top: solid 1pt #000000;
					font-family: Arial;
						font-size: 7pt;
										}					
                </style>
			</head>
			<body>
				<div class="page">
					<table style="width:210mm">
						<tbody>
							<tr>
								<td style="width:70mm" valign="top">
									<table style="width:70mm">
										<tbody>
											<tr>
												<td class="bordered">
													<xsl:value-of select="reqop:Customs/cat_ru:Code"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">(указывают код и наименование</td>
											</tr>
											<tr>
												<td class="bordered">
													<xsl:value-of select="reqop:Customs/cat_ru:OfficeName"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">таможенного органа (структурного подразделения)</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td style="width:40mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
								</td>
								<td style="width:100mm" valign="top">
									<table style="width:90mm">
										<tbody>
											<tr>
												<td class="bordered">
													<xsl:value-of select="reqop:Declarant/reqop:OrganizationName"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">(наименование юридического лица,</td>
											</tr>
											<tr>
												<td class="bordered">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">фамилия, имя, отчество (при наличии)</td>
											</tr>
											<tr>
												<td class="bordered">
													<xsl:if test="reqop:Declarant/reqop:Representative">
														<xsl:value-of select="reqop:Declarant/reqop:Representative/reqop:OrganizationName"/>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">индивидуального предпринимателя или физического лица, являющегося</td>
											</tr>
											<tr>
												<td class="bordered">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">декларантом или иным лицом, обладающим полномочиями в отношении товаров)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<br/>
									<br/>
									<span class="graph14Bold">
										<xsl:if test="reqop:DocSign='1'">ЗАЯВЛЕНИЕ</xsl:if>
										<xsl:if test="reqop:DocSign='0'">ТРЕБОВАНИЕ</xsl:if>
									</span>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<b>о проведении грузовых и иных операций в отношении товаров и транспортных средств</b>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:if test="reqop:DocSign='1'">
										№ <xsl:value-of select="reqop:ReqNumber"/>
									</xsl:if> от <span class="bordered">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="reqop:ReqDate"/>
										</xsl:call-template>
									</span> 
										<br/>
									<br/>
								</td>
							</tr>
							<xsl:if test="reqop:DocSign='0'">
								<tr>
									<td style="text-align: justify;">В целях реализации статьи 348 Таможенного кодекса Евразийского экономического союза и (или) пункта 2 части 3 статьи 109 Федерального закона от 3 августа 2018 г. N 289-ФЗ требуется проведение следующих операций в отношении товаров и транспортных средств, находящихся под таможенным контролем:</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td align="left">
													<xsl:choose>
														<xsl:when test="(reqop:Transportation/reqop:Value='1') or (reqop:Transportation/reqop:Value='t') or (reqop:Transportation/reqop:Value='true')">[X]</xsl:when>
														<xsl:otherwise>[ ]</xsl:otherwise>
													</xsl:choose>
													перевозка (транспортировка)
													</td>
												<td align="left">
													<xsl:choose>
														<xsl:when test="(reqop:Unpacking/reqop:Value='1') or (reqop:Unpacking/reqop:Value='t') or (reqop:Unpacking/reqop:Value='true')">[X]</xsl:when>
														<xsl:otherwise>[ ]</xsl:otherwise>
													</xsl:choose>
													вскрытие упаковки
													</td>
											</tr>
											<tr>
												<td align="left">
													<xsl:choose>
														<xsl:when test="(reqop:Weighing/reqop:Value='1') or (reqop:Weighing/reqop:Value='t') or (reqop:Weighing/reqop:Value='true')">[X]</xsl:when>
														<xsl:otherwise>[ ]</xsl:otherwise>
													</xsl:choose>
													взвешивание
													</td>
												<td align="left">
													<xsl:choose>
														<xsl:when test="(reqop:Packing/reqop:Value='1') or (reqop:Packing/reqop:Value='t') or (reqop:Packing/reqop:Value='true')">[X]</xsl:when>
														<xsl:otherwise>[ ]</xsl:otherwise>
													</xsl:choose>
													упаковка
													</td>
											</tr>
											<tr>
												<td align="left">
													<xsl:choose>
														<xsl:when test="(reqop:DifferentDefinitionQuantity/reqop:Value='1') or (reqop:DifferentDefinitionQuantity/reqop:Value='t') or (reqop:DifferentDefinitionQuantity/reqop:Value='true')">[X]</xsl:when>
														<xsl:otherwise>[ ]</xsl:otherwise>
													</xsl:choose>
													иное определение количества товаров
													</td>
												<td align="left">
													<xsl:choose>
														<xsl:when test="(reqop:Repackaging/reqop:Value='1') or (reqop:Repackaging/reqop:Value='t') or (reqop:Repackaging/reqop:Value='true')">[X]</xsl:when>
														<xsl:otherwise>[ ]</xsl:otherwise>
													</xsl:choose>
													переупаковка
													</td>
											</tr>
											<tr>
												<td align="left">
													<xsl:choose>
														<xsl:when test="(reqop:Loading/reqop:Value='1') or (reqop:Loading/reqop:Value='t') or (reqop:Loading/reqop:Value='true')">[X]</xsl:when>
														<xsl:otherwise>[ ]</xsl:otherwise>
													</xsl:choose>
													погрузка
													</td>
												<td align="left">
													<xsl:choose>
														<xsl:when test="(reqop:OpeningLocationGoods/reqop:Value='1') or (reqop:OpeningLocationGoods/reqop:Value='t') or (reqop:OpeningLocationGoods/reqop:Value='true')">[X]</xsl:when>
														<xsl:otherwise>[ ]</xsl:otherwise>
													</xsl:choose>
													вскрытие помещений, емкостей и других мест,
													</td>
											</tr>
											<tr>
												<td align="left">
													<xsl:choose>
														<xsl:when test="(reqop:Unloading/reqop:Value='1') or (reqop:Unloading/reqop:Value='t') or (reqop:Unloading/reqop:Value='true')">[X]</xsl:when>
														<xsl:otherwise>[ ]</xsl:otherwise>
													</xsl:choose>
													разгрузка
													</td>
												<td align="left">
														где находятся или могут находиться товары
													</td>
											</tr>
											<tr>
												<td align="left">
													<xsl:choose>
														<xsl:when test="(reqop:Overload/reqop:Value='1') or (reqop:Overload/reqop:Value='t') or (reqop:Overload/reqop:Value='true')">[X]</xsl:when>
														<xsl:otherwise>[ ]</xsl:otherwise>
													</xsl:choose>
													перегрузка
													</td>
												<td align="left">
													<xsl:choose>
														<xsl:when test="(reqop:DivisionConsignment/reqop:Value='1') or (reqop:DivisionConsignment/reqop:Value='t') or (reqop:DivisionConsignment/reqop:Value='true')">[X]</xsl:when>
														<xsl:otherwise>[ ]</xsl:otherwise>
													</xsl:choose>
													разделение товарной партии по отдельным
													</td>
											</tr>
											<tr>
												<td align="left">
													<xsl:choose>
														<xsl:when test="(reqop:CorrectionPackaging/reqop:Value='1') or (reqop:CorrectionPackaging/reqop:Value='t') or (reqop:CorrectionPackaging/reqop:Value='true')">[X]</xsl:when>
														<xsl:otherwise>[ ]</xsl:otherwise>
													</xsl:choose>
													исправление поврежденной упаковки
													</td>
												<td align="left">
													видам и (или) наименованиям товаров
													</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="uplined">
									<span class="graphLittle">(выбрать знаком Х одно или несколько значений)</span>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:value-of select="reqop:Transportation/reqop:Remark"/> 
											<xsl:value-of select="reqop:Weighing/reqop:Remark"/> 
											<xsl:value-of select="reqop:DifferentDefinitionQuantity/reqop:Remark"/> 
											<xsl:value-of select="reqop:Loading/reqop:Remark"/> 
											<xsl:value-of select="reqop:Unloading/reqop:Remark"/> 
											<xsl:value-of select="reqop:Overload/reqop:Remark"/> 
											<xsl:value-of select="reqop:CorrectionPackaging/reqop:Remark"/> 
											<xsl:value-of select="reqop:Unpacking/reqop:Remark"/> 
											<xsl:value-of select="reqop:Packing/reqop:Remark"/> 
											<xsl:value-of select="reqop:Repackaging/reqop:Remark"/> 
											<xsl:value-of select="reqop:OpeningLocationGoods/reqop:Remark"/> 
											<xsl:value-of select="reqop:DivisionConsignment/reqop:Remark"/> 
										
									</td>
							</tr>
							<tr>
								<td class="graphLittle">(пояснение к проводимым операциям и/или детальное описание конкретных действий, которые требуется провести)</td>
							</tr>
							<xsl:if test="reqop:DocSign='0'">
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td width="10%" align="left"> срок до:</td>
													<td class="bordered" width="30%">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="reqop:TermDate"/>
														</xsl:call-template>
														<xsl:if test="reqop:TermDate">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:value-of select="substring(reqop:TermDate, 12, 5)"/>
													</td>
													<td width="60%"/>
												</tr>
												<tr>
													<td/>
													<td class="graphLittle">(время, дата)</td>
													<td/>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<table align="left" style="width:210mm">
											<tbody>
												<tr>
													<td class="bordered" style="width:100mm">
														<xsl:value-of select="substring(reqop:CustomsPerson/reqop:PersonName,1,1)"/>
														<xsl:text>.</xsl:text>
														<xsl:if test="reqop:CustomsPerson/reqop:PersonMiddleName">
															<xsl:text></xsl:text>
															<xsl:value-of select="substring(reqop:CustomsPerson/reqop:PersonMiddleName,1,1)"/>.
														</xsl:if>
														<xsl:text> </xsl:text>
														<xsl:value-of select="reqop:CustomsPerson/reqop:PersonSurname"/>
														<!--xsl:if test="reqop:CustomsPerson/cat_ru:LNP"> (ЛНП: 
															<xsl:value-of select="reqop:CustomsPerson/cat_ru:LNP"/>
															<xsl:if test="reqop:CustomsPerson/cat_ru:CustomsCode">
																<xsl:text> (код ТО: </xsl:text>
																<xsl:value-of select="reqop:CustomsPerson/cat_ru:CustomsCode"/>
																<xsl:text>)</xsl:text>
															</xsl:if>)
														</xsl:if-->
													</td>
													<td style="width:10mm"/>
													<td class="bordered" style="width:40mm">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="reqop:CustomsPerson/reqop:SigningDateTime"/>
														</xsl:call-template>
														<xsl:if test="reqop:CustomsPerson/reqop:SigningDateTime">
															<xsl:text>, </xsl:text>
															<xsl:value-of select="substring(reqop:CustomsPerson/reqop:SigningDateTime, 12, 5)"/>
														</xsl:if>
													</td>
													<td style="width:10mm">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td class="bordered" style="width:40mm"/>
												</tr>
												<tr>
													<td class="graphLittle">(инициалы и фамилия уполномоченного должностного лица таможенного органа)</td>
													<td/>
													<td class="graphLittle">(дата и время направления требования)</td>
													<td/>
													<td class="graphLittle">(подпись)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table align="left" style="width:210mm">
											<tbody>
												<tr>
													<td class="bordered" style="width:100mm">
														<xsl:value-of select="substring(reqop:PersonSignature/reqop:PersonName,1,1)"/>
														<xsl:text>.</xsl:text>
														<xsl:if test="reqop:PersonSignature/reqop:PersonMiddleName">
															<xsl:text></xsl:text>
															<xsl:value-of select="substring(reqop:PersonSignature/reqop:PersonMiddleName,1,1)"/>.
														</xsl:if>
														<xsl:text> </xsl:text>
														<xsl:value-of select="reqop:PersonSignature/reqop:PersonSurname"/>
													</td>
													<td style="width:10mm">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td class="bordered" style="width:40mm">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="reqop:PersonSignature/reqop:IssueDate"/>
														</xsl:call-template>
													</td>
													<td style="width:10mm">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td class="bordered" style="width:40mm">
														<!--xsl:value-of select="reqop:PersonSignature/cat_ru:PersonSurname"/> 
													<xsl:value-of select="substring(reqop:PersonSignature/cat_ru:PersonName,1,1)"/>. 
													<xsl:value-of select="substring(reqop:PersonSignature/cat_ru:PersonMiddleName,1,1)"/>. -->
												</td>
												</tr>
												<tr>
													<td class="graphLittle" style="width:100mm">
													(инициалы и фамилия лица, получившего требование)
												</td>
													<td style="width:10mm">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td class="graphLittle" style="width:40mm">
													(дата получения требования)
												</td>
													<td style="width:10mm">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td class="graphLittle" style="width:20mm">
													(подпись)
												</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="reqop:DocSign='0'">
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="left">При направлении требования по почте или иным способом:</td>
								</tr>
								<tr>
									<td>
										<table align="left" style="width:210mm">
											<tbody>
												<tr>
													<td style="width:100mm">
														<xsl:if test="reqop:DirectionRequirement">
															<xsl:for-each select="reqop:DirectionRequirement/reqop:Address">
																<xsl:call-template name="Address"/> 
										            </xsl:for-each>
															<xsl:value-of select="reqop:DirectionRequirement/reqop:MethodDirection"/><!--; 
													<xsl:value-of select="reqop:DirectionRequirement/reqop:Person/cat_ru:PersonSurname"/> 
													<xsl:value-of select="substring(reqop:DirectionRequirement/reqop:Person/cat_ru:PersonName,1,1)"/>. 
													<xsl:value-of select="substring(reqop:DirectionRequirement/reqop:Person/cat_ru:PersonMiddleName,1,1)"/>. --></xsl:if>
													</td>
													<td style="width:10mm">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td style="width:20mm">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="reqop:DirectionRequirement/reqop:DateDirection"/>
														</xsl:call-template>
													</td>
													<td style="width:10mm">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td style="width:40mm">
														<xsl:value-of select="substring(reqop:DirectionRequirement/reqop:CustomsPerson/reqop:PersonName,1,1)"/>
														<xsl:text>.</xsl:text>
														<xsl:if test="reqop:DirectionRequirement/reqop:CustomsPerson/reqop:PersonMiddleName">
															<xsl:text></xsl:text>
															<xsl:value-of select="substring(reqop:DirectionRequirement/reqop:CustomsPerson/reqop:PersonMiddleName,1,1)"/>.
														</xsl:if>
														<xsl:text> </xsl:text>
														<xsl:value-of select="reqop:DirectionRequirement/reqop:CustomsPerson/reqop:PersonSurname"/>
														<!--xsl:value-of select="reqop:DirectionRequirement/reqop:CustomsPerson/cat_ru:LNP"/>
														<xsl:if test="reqop:DirectionRequirement/reqop:CustomsPerson/cat_ru:CustomsCode">
															<xsl:text> (код ТО: </xsl:text>
															<xsl:value-of select="reqop:DirectionRequirement/reqop:CustomsPerson/cat_ru:CustomsCode"/>
															<xsl:text>)</xsl:text>
														</xsl:if-->
													</td>
												</tr>
												<tr>
													<td class="uplined" style="width:100mm">(сведения о месте, куда направлено требование, и способе его направления)</td>
													<td style="width:10mm">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td class="uplined" style="width:20mm">(дата направления требования)</td>
													<td style="width:10mm">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td class="uplined" style="width:40mm">(инициалы, фамилия и подпись должностного лица таможенного органа, направившего требование)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
