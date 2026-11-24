<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:rstvha="urn:customs.ru:Information:SQDocuments:RosstandartVehicleApproval:5.24.0">
	<!-- Шаблон для типа RosstandartVehicleApprovalType -->
	<xsl:template match="rstvha:RosstandartVehicleApproval">
		<xsl:param name="w" select="190"/>
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
                  .ib{
					font-style: italic;
					font-weight: bold;
                  }
                </style>
			</head>
			<body>
				<xsl:if test="rstvha:DocKind = 0">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td class="bordered" align="center" valign="middle">
										<b>
											<xsl:text>Система сертификации ГОСТ Р</xsl:text>
											<br/>
											<xsl:text>Федеральное агентство по техническому регулированию и метрологии</xsl:text>
										</b>
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<table>
											<tbody>
												<tr>
													<td align="center">
														<br/>
														<br/>
														<xsl:text>Сертификат соответствия</xsl:text>
														<br/>
														<br/>
													</td>
												</tr>
											</tbody>
										</table>
										<table>
											<tbody>
												<tr valign="top">
													<td width="33%" align="center">РСТ</td>
													<td width="67%">
														<xsl:text>N </xsl:text>
														<xsl:apply-templates select="rstvha:DocId"/>
														<br/>
														<br/>
														<xsl:text>Срок действия с </xsl:text>
														<xsl:apply-templates select="rstvha:TCvalidityBegin" mode="russian_date"/>
														<xsl:if test="rstvha:TCvalidityEnd">
															<xsl:text> по </xsl:text>
															<xsl:apply-templates select="rstvha:TCvalidityEnd" mode="russian_date"/>
														</xsl:if>
													</td>
												</tr>
											</tbody>
										</table>
										<table>
											<tbody>
												<tr>
													<td width="80%"/>
													<td width="20%">
														<xsl:text>N </xsl:text>
														<xsl:apply-templates select="rstvha:BlankNumber"/>
													</td>
												</tr>
											</tbody>
										</table>
										<table>
											<tbody>
												<tr>
													<td>
														<br/>
														<xsl:text>ОРГАН ПО СЕРТИФИКАЦИИ </xsl:text>
														<xsl:apply-templates select="rstvha:CertificateOrg"/>
													</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr valign="top">
													<td rowspan="2">
														<xsl:text>ПРОДУКЦИЯ </xsl:text>
														<br/>
														<xsl:apply-templates select="rstvha:TransportMean"/>
													</td>
													<td width="25%" style="border-left:1px solid black;border-top:1px solid black;">
														<xsl:text>код ОК 005 (ОКП):</xsl:text>
														<br/>
														<xsl:apply-templates select="rstvha:TransportMean/rstvha:ProductCode"/>
													</td>
												</tr>
												<tr>
													<td/>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr valign="top">
													<td rowspan="2">
														<xsl:text>СООТВЕТСТВУЕТ ТРЕБОВАНИЯМ НОРМАТИВНЫХ ДОКУМЕНТОВ </xsl:text>
														<br/>
														<xsl:apply-templates select="rstvha:NotifLawArticle"/>
													</td>
													<td width="25%" style="border-left:1px solid black;border-top:1px solid black;">
														<xsl:text>код ТН ВЭД России:</xsl:text>
														<br/>
														<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tnved"/>
													</td>
												</tr>
												<tr>
													<td/>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr>
													<td>
														<xsl:text>ИЗГОТОВИТЕЛЬ </xsl:text>
														<xsl:apply-templates select="rstvha:TransportMean/rstvha:Manufacturer"/>
													</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr>
													<td>
														<xsl:text>СЕРТИФИКАТ ВЫДАН </xsl:text>
														<xsl:apply-templates select="rstvha:Applicant"/>
													</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr>
													<td>
														<xsl:text>НА ОСНОВАНИИ </xsl:text>
														<br/>
														<xsl:for-each select="rstvha:BaseDocuments">
															<xsl:if test="position() &gt; 1">; </xsl:if>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr>
													<td>
														<xsl:text>ДОПОЛНИТЕЛЬНАЯ ИНФОРМАЦИЯ </xsl:text>
														<br/>
														<xsl:apply-templates select="rstvha:TCtypeApprovalsAddition"/>
													</td>
												</tr>
											</tbody>
										</table>
										<!-- подвал -->
										<br/>
										<table>
											<tbody>
												<tr valign="bottom">
													<td width="30%">Руководитель органа</td>
													<td width="5%"/>
													<td width="30%" style="border-bottom: 1px solid black;"/>
													<td width="5%"/>
													<td width="30%" style="border-bottom: 1px solid black;" align="center">
														<xsl:apply-templates select="rstvha:RegisterSignature" mode="person_signature"/>
													</td>
												</tr>
												<tr align="center">
													<td/>
													<td/>
													<td style="font-size:8pt;">подпись</td>
													<td/>
													<td style="font-size:8pt;">инициалы, фамилия</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr>
													<td>М.П.</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr valign="bottom">
													<td width="30%">Эксперт</td>
													<td width="5%"/>
													<td width="30%" style="border-bottom: 1px solid black;"/>
													<td width="5%"/>
													<td width="30%" style="border-bottom: 1px solid black;" align="center">
														<xsl:apply-templates select="rstvha:Expert" mode="person_signature"/>
													</td>
												</tr>
												<tr align="center">
													<td/>
													<td/>
													<td style="font-size:8pt;">подпись</td>
													<td/>
													<td style="font-size:8pt;">инициалы, фамилия</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr align="center">
													<td>Сертификат имеет юридическую силу на всей территории Российской Федерации</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<br/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="rstvha:DocKind = 1">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td class="bordered" align="center" valign="middle">
										<b>
											<xsl:text>Система сертификации ГОСТ Р</xsl:text>
											<br/>
											<xsl:text>Федеральное агентство по техническому регулированию и метрологии</xsl:text>
										</b>
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<table>
											<tbody>
												<tr>
													<td align="center">
														<br/>
														<br/>
														<xsl:text>Сертификат соответствия</xsl:text>
														<br/>
														<br/>
													</td>
												</tr>
											</tbody>
										</table>
										<table>
											<tbody>
												<tr valign="top">
													<td width="33%" align="center"/>
													<td width="67%">
														<xsl:text>N </xsl:text>
														<xsl:apply-templates select="rstvha:DocId"/>
														<br/>
														<br/>
														<xsl:text>Срок действия с </xsl:text>
														<xsl:apply-templates select="rstvha:TCvalidityBegin" mode="russian_date"/>
														<xsl:if test="rstvha:TCvalidityEnd">
															<xsl:text> по </xsl:text>
															<xsl:apply-templates select="rstvha:TCvalidityEnd" mode="russian_date"/>
														</xsl:if>
													</td>
												</tr>
											</tbody>
										</table>
										<table>
											<tbody>
												<tr>
													<td width="80%"/>
													<td width="20%">
														<xsl:text>N </xsl:text>
														<xsl:apply-templates select="rstvha:BlankNumber"/>
													</td>
												</tr>
											</tbody>
										</table>
										<table>
											<tbody>
												<tr>
													<td>
														<br/>
														<xsl:text>ОРГАН ПО СЕРТИФИКАЦИИ </xsl:text>
														<xsl:apply-templates select="rstvha:CertificateOrg"/>
													</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr valign="top">
													<td rowspan="2">
														<xsl:text>ПРОДУКЦИЯ </xsl:text>
														<br/>
														<xsl:apply-templates select="rstvha:TransportMean"/>
													</td>
													<td width="25%" style="border-left:1px solid black;border-top:1px solid black;">
														<xsl:text>код ОК 005 (ОКП):</xsl:text>
														<br/>
														<xsl:apply-templates select="rstvha:TransportMean/rstvha:ProductCode"/>
													</td>
												</tr>
												<tr>
													<td/>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr valign="top">
													<td rowspan="2">
														<xsl:text>СООТВЕТСТВУЕТ ТРЕБОВАНИЯМ НОРМАТИВНЫХ ДОКУМЕНТОВ </xsl:text>
														<br/>
														<xsl:apply-templates select="rstvha:NotifLawArticle"/>
													</td>
													<td width="25%" style="border-left:1px solid black;border-top:1px solid black;">
														<xsl:text>код ТН ВЭД России:</xsl:text>
														<br/>
														<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tnved"/>
													</td>
												</tr>
												<tr>
													<td/>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr>
													<td>
														<xsl:text>ИЗГОТОВИТЕЛЬ </xsl:text>
														<xsl:apply-templates select="rstvha:TransportMean/rstvha:Manufacturer"/>
													</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr>
													<td>
														<xsl:text>СЕРТИФИКАТ ВЫДАН </xsl:text>
														<xsl:apply-templates select="rstvha:Applicant"/>
													</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr>
													<td>
														<xsl:text>НА ОСНОВАНИИ </xsl:text>
														<br/>
														<xsl:for-each select="rstvha:BaseDocuments">
															<xsl:if test="position() &gt; 1">; </xsl:if>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr>
													<td>
														<xsl:text>ДОПОЛНИТЕЛЬНАЯ ИНФОРМАЦИЯ </xsl:text>
														<br/>
														<xsl:apply-templates select="rstvha:TCtypeApprovalsAddition"/>
													</td>
												</tr>
											</tbody>
										</table>
										<!-- подвал -->
										<br/>
										<table>
											<tbody>
												<tr valign="bottom">
													<td width="30%">Руководитель органа</td>
													<td width="5%"/>
													<td width="30%" style="border-bottom: 1px solid black;"/>
													<td width="5%"/>
													<td width="30%" style="border-bottom: 1px solid black;" align="center">
														<xsl:apply-templates select="rstvha:RegisterSignature" mode="person_signature"/>
													</td>
												</tr>
												<tr align="center">
													<td/>
													<td/>
													<td style="font-size:8pt;">подпись</td>
													<td/>
													<td style="font-size:8pt;">инициалы, фамилия</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr>
													<td>М.П.</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr valign="bottom">
													<td width="30%">Эксперт</td>
													<td width="5%"/>
													<td width="30%" style="border-bottom: 1px solid black;"/>
													<td width="5%"/>
													<td width="30%" style="border-bottom: 1px solid black;" align="center">
														<xsl:apply-templates select="rstvha:Expert" mode="person_signature"/>
													</td>
												</tr>
												<tr align="center">
													<td/>
													<td/>
													<td style="font-size:8pt;">подпись</td>
													<td/>
													<td style="font-size:8pt;">инициалы, фамилия</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr align="center">
													<td>Сертификат не применяется при обязательной сертификации</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<br/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="rstvha:DocKind = 2">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td align="center">ТАМОЖЕННЫЙ СОЮЗ</td>
								</tr>
								<tr>
									<td align="center">ОДОБРЕНИЕ ТИПА ТРАНСПОРТНОГО СРЕДСТВА</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr>
									<td width="30%">EAC</td>
									<td width="40%"/>
									<td width="30%" align="center" style="border-bottom: 1px solid black;">
										<xsl:apply-templates select="rstvha:BlankNumber"/>
									</td>
								</tr>
								<tr>
									<td/>
									<td/>
									<td align="center" style="font-size:8pt;">(учетный номер бланка)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<xsl:text>№ </xsl:text>
										<span style="display:inline-block;width:50mm;border-bottom:1px solid black;text-align:center;">
											<xsl:apply-templates select="rstvha:DocId"/>
										</span>
										<br/>
										<xsl:text>Срок действия с </xsl:text>
										<span style="display:inline-block;width:40mm;border-bottom:1px solid black;text-align:center;">
											<xsl:apply-templates select="rstvha:TCvalidityBegin" mode="russian_date"/>
										</span>
										<xsl:if test="rstvha:TCvalidityEnd">
											<xsl:text> по </xsl:text>
											<span style="display:inline-block;width:40mm;border-bottom:1px solid black;text-align:center;">
												<xsl:apply-templates select="rstvha:TCvalidityEnd" mode="russian_date"/>
											</span>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<xsl:text>ОРГАН ПО СЕРТИФИКАЦИИ</xsl:text>
									</td>
								</tr>
								<tr>
									<td style="border-bottom: 1px solid black;">
										<xsl:apply-templates select="rstvha:CertificateOrg" mode="otts"/>
									</td>
								</tr>
								<tr>
									<td style="font-size: 8pt;" align="center">
										<xsl:text>(полное и сокращенное наименование, адрес, номер, окончание срока действия аттестата аккредитации)</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<xsl:text>ТРАНСПОРТНЫЕ СРЕДСТВА</xsl:text>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr valign="top">
													<td width="50%" class="bordered">
														МАРКА
													</td>
													<td width="50%" class="bordered">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:Tcbrand">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tcbrand"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													КОММЕРЧЕСКОЕ НАИМЕНОВАНИЕ
													</td>
													<td class="bordered">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:TCtradeName">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:TCtradeName"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ТИП
													</td>
													<td class="bordered">
														<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tctype"/>
													</td>
												</tr>
												<xsl:if test="rstvha:TransportMean/rstvha:TctypeOtherManufacturer">
													<tr valign="top">
														<td class="bordered">
														БАЗОВОЕ ТРАНСПОРТНОЕ СРЕДСТВО/ШАССИ
														</td>
														<td class="bordered">
															<xsl:apply-templates select="rstvha:TransportMean/rstvha:TctypeOtherManufacturer"/>
														</td>
													</tr>
												</xsl:if>
												<tr valign="top">
													<td class="bordered">
													МОДИФИКАЦИИ
													</td>
													<td class="bordered">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:Tcmodifications">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tcmodifications"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													КАТЕГОРИЯ
													</td>
													<td class="bordered">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:Tccategory">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tccategory"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ЭКОЛОГИЧЕСКИЙ КЛАСС
													</td>
													<td class="bordered">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:EcoClass">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:EcoClass"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ЗАЯВИТЕЛЬ И ЕГО АДРЕС
													</td>
													<td class="bordered">
														<xsl:apply-templates mode="org" select="rstvha:Applicant"/>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ИЗГОТОВИТЕЛЬ И ЕГО АДРЕС
													</td>
													<td class="bordered">
														<xsl:for-each select="rstvha:TransportMean/rstvha:Manufacturer">
															<xsl:if test="position() &gt; 1">
																<br/>
																<br/>
															</xsl:if>
															<xsl:apply-templates mode="org" select="."/>
														</xsl:for-each>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ПРЕДСТАВИТЕЛЬ ИЗГОТОВИТЕЛЯ И ЕГО АДРЕС
													</td>
													<td class="bordered">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:ManufacturerAgent">
																<xsl:apply-templates mode="org" select="rstvha:TransportMean/rstvha:ManufacturerAgent"/>
															</xsl:when>
															<xsl:otherwise> -- </xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													СБОРОЧНЫЙ ЗАВОД И ЕГО АДРЕС
													</td>
													<td class="bordered">
														<xsl:for-each select="rstvha:TransportMean/rstvha:AssemblyPlant">
															<xsl:if test="position() &gt; 1">
																<br/>
																<br/>
															</xsl:if>
															<xsl:apply-templates mode="org" select="."/>
														</xsl:for-each>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ПОСТАВЩИК СБОРОЧНЫХ КОМПЛЕКТОВ И ЕГО АДРЕС
													</td>
													<td class="bordered">
														<xsl:for-each select="rstvha:TransportMean/rstvha:Supplier">
															<xsl:if test="position() &gt; 1">
																<br/>
																<br/>
															</xsl:if>
															<xsl:apply-templates mode="org" select="."/>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
										<xsl:text>соответствуют  требованиям  технического  регламента  Таможенного  союза "О безопасности колесных транспортных средств".</xsl:text>
										<br/>
										<br/>
										<xsl:choose>
											<xsl:when test="rstvha:TransportMean/rstvha:SeriesSign=3">
												<xsl:text>Действие данного ОДОБРЕНИЯ ТИПА ТРАНСПОРТНОГО СРЕДСТВА распространяется на серийно выпускаемую продукцию.</xsl:text>
											</xsl:when>
											<xsl:when test="rstvha:TransportMean/rstvha:SeriesSign=2">
												<xsl:text>Действие данного ОДОБРЕНИЯ ТИПА ТРАНСПОРТНОГО СРЕДСТВА распространяется на партию транспортных средств в количестве </xsl:text>
												<xsl:apply-templates select="rstvha:TransportMean/rstvha:PartySize"/>
												<xsl:text> шт. </xsl:text>
												<xsl:if test="rstvha:TransportMean/rstvha:VINIDDetails">
													<xsl:text> с идентификационными номерами (VIN) </xsl:text>
													<xsl:for-each select="rstvha:TransportMean/rstvha:VINIDDetails/rstvha:VINRange">
														<xsl:if test="position() &gt; 1">, </xsl:if>
														<xsl:text> с </xsl:text>
														<xsl:apply-templates select="rstvha:FirstVIN"/>
														<xsl:text> по </xsl:text>
														<xsl:apply-templates select="rstvha:LastVIN"/>
													</xsl:for-each>
													<xsl:if test="rstvha:TransportMean/rstvha:VINIDDetails/rstvha:VINRange">, </xsl:if>
													<xsl:for-each select="rstvha:TransportMean/rstvha:VINIDDetails/rstvha:VinList/rstvha:VINID">
														<xsl:if test="position() != 1">, </xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
													<xsl:text>.</xsl:text>
												</xsl:if>
											</xsl:when>
										</xsl:choose>
										<br/>
										<br/>
										Данное ОДОБРЕНИЕ ТИПА ТРАНСПОРТНОГО СРЕДСТВА
										<br/>
										без приложений недействительно.
										<br/>
										<br/>
										Приложение N 1. Общие характеристики транспортного средства<br/>
										Приложение  N  2.  Перечень документов, явившихся основанием для оформления<br/>
										ОДОБРЕНИЯ ТИПА ТРАНСПОРТНОГО СРЕДСТВА<br/>
										Приложение  N 3. Описание маркировки транспортного средства<br/>
										Приложение N 4. Общий вид транспортного средства на ... страницах<br/>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<xsl:text>ДОПОЛНИТЕЛЬНАЯ ИНФОРМАЦИЯ </xsl:text>
										<xsl:choose>
											<xsl:when test="rstvha:TCtypeApprovalsAddition">
												<xsl:apply-templates select="rstvha:TCtypeApprovalsAddition"/>
											</xsl:when>
											<xsl:otherwise> -- </xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<table>
											<tbody>
												<tr valign="bottom">
													<td width="50%">Руководитель органа по сертификации</td>
													<td width="1%"/>
													<td width="20%" style="border-bottom: 1px solid black;"/>
													<td width="1%"/>
													<td width="28%" style="border-bottom: 1px solid black;" align="center">
														<xsl:apply-templates mode="person_signature" select="rstvha:RegisterSignature"/>
													</td>
												</tr>
												<tr>
													<td/>
													<td/>
													<td align="center" style="font-size: 8pt;">(подпись)</td>
													<td/>
													<td align="center" style="font-size: 8pt;">(инициалы, фамилия)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<xsl:text>Дата оформления </xsl:text>
										<xsl:apply-templates select="rstvha:TCvalidityBegin" mode="date_month"/>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<xsl:text>ОДОБРЕНИЕ ТИПА ТРАНСПОРТНОГО СРЕДСТВА УТВЕРЖДЕНО.</xsl:text>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<xsl:text>Внесена запись в реестр за N </xsl:text>
										<xsl:apply-templates select="rstvha:DocId"/>
										<xsl:text> от </xsl:text>
										<xsl:apply-templates select="rstvha:TCvalidityBegin" mode="date_month"/>
										<xsl:text> г.</xsl:text>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<xsl:text>Руководитель (заместитель руководителя)</xsl:text>
										<table>
											<tbody>
												<tr valign="bottom">
													<td width="50%" style="border-bottom: 1px solid black;">
														<xsl:apply-templates select="rstvha:CertificateOrg/cat_ru:OrganizationName"/>
														<xsl:if test="not(rstvha:CertificateOrg/cat_ru:OrganizationName) and rstvha:CertificateOrg/cat_ru:ShortName">
															<xsl:apply-templates select="rstvha:CertificateOrg/cat_ru:ShortName"/>
														</xsl:if>
													</td>
													<td width="1%"/>
													<td width="20%" style="border-bottom: 1px solid black;"/>
													<td width="1%"/>
													<td width="28%" style="border-bottom: 1px solid black;" align="center">
														<xsl:apply-templates mode="person_signature" select="rstvha:RegisterSignature"/>
													</td>
												</tr>
												<tr>
													<td align="center" style="font-size: 8pt;">(наименование уполномоченного органа государственного управления)</td>
													<td/>
													<td align="center" style="font-size: 8pt;">(подпись)</td>
													<td/>
													<td align="center" style="font-size: 8pt;">(инициалы, фамилия)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="rstvha:DocKind = 3">
					<div class="page" style="width: {$w}mm;font-size:12pt;">
						<table>
							<tbody>
								<tr>
									<td align="center">ТАМОЖЕННЫЙ СОЮЗ</td>
								</tr>
								<tr>
									<td align="center">ОДОБРЕНИЕ ТИПА ТРАНСПОРТНОГО СРЕДСТВА</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<!--br/>
						<table>
							<tbody>
								<tr>
									<td width="30%">EAC</td>
									<td width="40%"/>
									<td width="30%" align="center" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rstvha:BlankNumber"/>
									</td>
								</tr>
								<tr>
									<td/>
									<td/>
									<td align="center" style="font-size:9pt;">(учетный номер бланка)</td>
								</tr>
							</tbody>
						</table-->
						<br/>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<xsl:text>№ </xsl:text>
										<span style="display:inline-block;width:50mm;border-bottom:1px solid black;text-align:center;" class="ib">
											<xsl:apply-templates select="rstvha:DocId"/>
										</span>
										<br/>
										<xsl:text>Срок действия с </xsl:text>
										<span style="display:inline-block;width:40mm;border-bottom:1px solid black;text-align:center;" class="ib">
											<xsl:apply-templates select="rstvha:TCvalidityBegin" mode="russian_date"/>
										</span>
										<xsl:if test="rstvha:TCvalidityEnd">
											<xsl:text> по </xsl:text>
											<span style="display:inline-block;width:40mm;border-bottom:1px solid black;text-align:center;" class="ib">
												<xsl:apply-templates select="rstvha:TCvalidityEnd" mode="russian_date"/>
											</span>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<xsl:text>ОРГАН ПО СЕРТИФИКАЦИИ</xsl:text>
									</td>
								</tr>
								<tr>
									<td style="border-bottom: 1px solid black;">
										<xsl:apply-templates select="rstvha:CertificateOrg" mode="otts2"/>
									</td>
								</tr>
								<tr>
									<td style="font-size: 9pt;" align="center">
										<xsl:text>(полное и сокращенное наименование, адрес, номер, окончание срока действия аттестата аккредитации)</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<xsl:text>ТРАНСПОРТНЫЕ СРЕДСТВА</xsl:text>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr valign="top">
													<td width="50%" class="bordered">
														МАРКА
													</td>
													<td width="50%" class="bordered ib">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:Tcbrand">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tcbrand"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													КОММЕРЧЕСКОЕ НАИМЕНОВАНИЕ
													</td>
													<td class="bordered ib">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:TCtradeName">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:TCtradeName"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ТИП
													</td>
													<td class="bordered ib">
														<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tctype"/>
													</td>
												</tr>
												<xsl:if test="rstvha:TransportMean/rstvha:TctypeOtherManufacturer">
													<tr valign="top">
														<td class="bordered">
														ШАССИ
														</td>
														<td class="bordered ib">
															<xsl:apply-templates select="rstvha:TransportMean/rstvha:TctypeOtherManufacturer"/>
														</td>
													</tr>
												</xsl:if>
												<tr valign="top">
													<td class="bordered">
													МОДИФИКАЦИИ
													</td>
													<td class="bordered ib">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:Tcmodifications">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tcmodifications"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													КАТЕГОРИЯ
													</td>
													<td class="bordered ib">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:Tccategory">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tccategory"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ЭКОЛОГИЧЕСКИЙ КЛАСС
													</td>
													<td class="bordered ib">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:EcoClass">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:EcoClass"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													КОД ОКП/ТН ВЭД
													</td>
													<td class="bordered ib">
														<xsl:apply-templates select="rstvha:TransportMean/rstvha:ProductCode"/>
														<xsl:if test="rstvha:TransportMean/rstvha:ProductCode and rstvha:TransportMean/rstvha:Tnved">
															<xsl:text> / </xsl:text>
														</xsl:if>
														<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tnved"/>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ЗАЯВИТЕЛЬ И ЕГО АДРЕС
													</td>
													<td class="bordered ib">
														<xsl:apply-templates mode="org" select="rstvha:Applicant"/>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ИЗГОТОВИТЕЛЬ И ЕГО АДРЕС
													</td>
													<td class="bordered ib">
														<xsl:for-each select="rstvha:TransportMean/rstvha:Manufacturer">
															<xsl:if test="position() &gt; 1">
																<br/>
																<br/>
															</xsl:if>
															<xsl:apply-templates mode="org" select="."/>
														</xsl:for-each>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ПРЕДСТАВИТЕЛЬ ИЗГОТОВИТЕЛЯ И ЕГО АДРЕС
													</td>
													<td class="bordered ib">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:ManufacturerAgent">
																<xsl:apply-templates mode="org" select="rstvha:TransportMean/rstvha:ManufacturerAgent"/>
															</xsl:when>
															<xsl:otherwise> -- </xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													СБОРОЧНЫЙ(Е) ЗАВОД(Ы) И ЕГО (ИХ) АДРЕС(А)
													</td>
													<td class="bordered ib">
														<xsl:for-each select="rstvha:TransportMean/rstvha:AssemblyPlant">
															<xsl:if test="position() &gt; 1">
																<br/>
																<br/>
															</xsl:if>
															<xsl:apply-templates mode="org" select="."/>
														</xsl:for-each>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ПОСТАВЩИК(И) СБОРОЧНЫХ КОМПЛЕКТОВ И ЕГО (ИХ) АДРЕС(А)
													</td>
													<td class="bordered ib">
														<xsl:for-each select="rstvha:TransportMean/rstvha:Supplier">
															<xsl:if test="position() &gt; 1">
																<br/>
																<br/>
															</xsl:if>
															<xsl:apply-templates mode="org" select="."/>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
										<xsl:text>соответствуют  требованиям  технического  регламента  Таможенного  союза "О безопасности колесных транспортных средств".</xsl:text>
										<br/>
										<br/>
										<xsl:choose>
											<xsl:when test="rstvha:TransportMean/rstvha:SeriesSign=3">
												<xsl:text>Действие данного ОДОБРЕНИЯ ТИПА ТРАНСПОРТНОГО СРЕДСТВА распространяется на серийно выпускаемую продукцию.</xsl:text>
											</xsl:when>
											<xsl:when test="rstvha:TransportMean/rstvha:SeriesSign=2">
												<xsl:text>Действие данного ОДОБРЕНИЯ ТИПА ТРАНСПОРТНОГО СРЕДСТВА распространяется на партию транспортных средств в количестве </xsl:text>
												<span class="ib"><xsl:apply-templates select="rstvha:TransportMean/rstvha:PartySize"/></span>
												<xsl:text> шт. </xsl:text>
												<xsl:if test="rstvha:TransportMean/rstvha:VINIDDetails">
													<xsl:text> с идентификационными номерами (VIN) </xsl:text>
													<xsl:for-each select="rstvha:TransportMean/rstvha:VINIDDetails/rstvha:VINRange">
														<xsl:if test="position() &gt; 1">, </xsl:if>
														<xsl:text> с </xsl:text>
														<xsl:apply-templates select="rstvha:FirstVIN"/>
														<xsl:text> по </xsl:text>
														<xsl:apply-templates select="rstvha:LastVIN"/>
													</xsl:for-each>
													<xsl:if test="rstvha:TransportMean/rstvha:VINIDDetails/rstvha:VINRange">, </xsl:if>
													<xsl:for-each select="rstvha:TransportMean/rstvha:VINIDDetails/rstvha:VinList/rstvha:VINID">
														<xsl:if test="position() != 1">, </xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
													<xsl:text>.</xsl:text>
												</xsl:if>
											</xsl:when>
										</xsl:choose>
										<br/>
										<br/>
										Данное ОДОБРЕНИЕ ТИПА ТРАНСПОРТНОГО СРЕДСТВА
										<br/>
										без приложений недействительно.
										<br/>
										<br/>
										Приложение N 1. Общие характеристики транспортного средства<br/>
										Приложение  N  2.  Перечень документов, явившихся основанием для оформления<br/>
										ОДОБРЕНИЯ ТИПА ТРАНСПОРТНОГО СРЕДСТВА<br/>
										Приложение  N 3. Описание маркировки транспортного средства<br/>
										Приложение N 4. Общий вид транспортного средства на ... страницах<br/>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<span class="ib">ДОПОЛНИТЕЛЬНАЯ ИНФОРМАЦИЯ </span>
										<xsl:choose>
											<xsl:when test="rstvha:TCtypeApprovalsAddition">
												<xsl:apply-templates select="rstvha:TCtypeApprovalsAddition"/>
											</xsl:when>
											<xsl:otherwise> отсутствует </xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<table>
											<tbody>
												<tr valign="bottom">
													<td width="50%" class="ib">Руководитель органа по сертификации</td>
													<td width="1%"/>
													<td width="20%" style="border-bottom: 1px solid black;"/>
													<td width="1%"/>
													<td width="28%" style="border-bottom: 1px solid black;" align="center" class="ib">
														<xsl:apply-templates mode="person_signature" select="rstvha:RegisterSignature"/>
													</td>
												</tr>
												<tr>
													<td/>
													<td/>
													<td align="center" style="font-size: 9pt;">(подпись)</td>
													<td/>
													<td align="center" style="font-size: 9pt;">(инициалы, фамилия)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<!--tr>
									<td>
										<br/>
										<xsl:text>Дата оформления </xsl:text>
										<xsl:call-template name="date_month">
											<xsl:with-param name="dateIn" select="rstvha:TCvalidityBegin"/>
										</xsl:call-template>
									</td>
								</tr-->
								<tr>
									<td class="ib">
										<br/>
										<xsl:text>ОДОБРЕНИЕ ТИПА ТРАНСПОРТНОГО СРЕДСТВА УТВЕРЖДЕНО.</xsl:text>
									</td>
								</tr>
								<tr>
									<td class="ib">
										<br/>
										<xsl:text>Внесена запись в реестр за N </xsl:text>
										<xsl:apply-templates select="rstvha:DocId"/>
										<xsl:text> от </xsl:text>
										<xsl:call-template name="date_month">
											<xsl:with-param name="dateIn" select="rstvha:TCvalidityBegin"/>
										</xsl:call-template>
										<xsl:text> г.</xsl:text>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<table>
											<tbody>
												<tr valign="bottom">
													<td width="20%" class="ib">Руководитель</td>
													<td width="30%" style="border-bottom: 1px solid black;" class="ib">
														<xsl:apply-templates select="rstvha:CertificateOrg/cat_ru:OrganizationName"/>
														<xsl:if test="not(rstvha:CertificateOrg/cat_ru:OrganizationName) and rstvha:CertificateOrg/cat_ru:ShortName">
															<xsl:apply-templates select="rstvha:CertificateOrg/cat_ru:ShortName"/>
														</xsl:if>
													</td>
													<td width="1%"/>
													<td width="20%" style="border-bottom: 1px solid black;"/>
													<td width="1%"/>
													<td width="28%" style="border-bottom: 1px solid black;" align="center" class="ib">
														<xsl:apply-templates mode="person_signature" select="rstvha:RegisterSignature"/>
													</td>
												</tr>
												<tr valign="top">
													<td></td>
													<td align="center" style="font-size: 9pt;">наименование федерального органа исполнительной власти, выполняющего функции компетентного административного органа Российской Федерации в соответствии с Женевским Соглашением 1958 года</td>
													<td/>
													<td align="center" style="font-size: 9pt;">подпись</td>
													<td/>
													<td align="center" style="font-size: 9pt;">инициалы, фамилия</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="rstvha:DocKind = 4">
					<div class="page" style="width: {$w}mm;font-size:12pt;">
						<table>
							<tbody>
								<tr>
									<td align="center">ТАМОЖЕННЫЙ СОЮЗ</td>
								</tr>
								<tr>
									<td align="center">СВИДЕТЕЛЬСТВО О БЕЗОПАСНОСТИ КОНСТРУКЦИИ<br/>ТРАНСПОРТНОГО СРЕДСТВА</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr>
									<td width="30%">EAC</td>
									<td width="40%"/>
									<td width="30%" align="center" style="border-bottom: 1px solid black;">
										<xsl:apply-templates select="rstvha:BlankNumber"/>
									</td>
								</tr>
								<tr>
									<td/>
									<td/>
									<td align="center" style="font-size:8pt;">(учетный номер бланка)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<xsl:text>№ </xsl:text>
										<span style="display:inline-block;width:50mm;border-bottom:1px solid black;text-align:center;">
											<xsl:apply-templates select="rstvha:DocRegNumber_1"/>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<xsl:text>ИСПЫТАТЕЛЬНАЯ ЛАБОРАТОРИЯ</xsl:text>
										
									</td>
								</tr>
								<tr>
									<td style="border-bottom: 1px solid black;">
										<xsl:apply-templates select="rstvha:CertificateOrg" mode="otts"/>
									</td>
								</tr>
								<tr>
									<td align="center" style="font-size:8pt;">(полное и сокращенное наименование, адрес, номер, окончание срока действия аттестата аккредитации)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<xsl:text>ТРАНСПОРТНОЕ СРЕДСТВО</xsl:text>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr valign="top">
													<td width="50%" class="bordered">
														МАРКА
													</td>
													<td width="50%" class="bordered ib">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:Tcbrand">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tcbrand"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													КОММЕРЧЕСКОЕ НАИМЕНОВАНИЕ
													</td>
													<td class="bordered ib">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:TCtradeName">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:TCtradeName"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ТИП
													</td>
													<td class="bordered ib">
														<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tctype"/>
													</td>
												</tr>
												<xsl:if test="rstvha:TransportMean/rstvha:TctypeOtherManufacturer">
													<tr valign="top">
														<td class="bordered">
														ШАССИ
														</td>
														<td class="bordered ib">
															<xsl:apply-templates select="rstvha:TransportMean/rstvha:TctypeOtherManufacturer"/>
														</td>
													</tr>
												</xsl:if>
												<tr valign="top">
													<td class="bordered">
													МОДИФИКАЦИИ
													</td>
													<td class="bordered ib">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:Tcmodifications">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tcmodifications"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													КАТЕГОРИЯ
													</td>
													<td class="bordered ib">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:Tccategory">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tccategory"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ЭКОЛОГИЧЕСКИЙ КЛАСС
													</td>
													<td class="bordered ib">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:EcoClass">
																<xsl:apply-templates select="rstvha:TransportMean/rstvha:EcoClass"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text> -- </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													КОД ОКП/ТН ВЭД
													</td>
													<td class="bordered ib">
														<xsl:apply-templates select="rstvha:TransportMean/rstvha:ProductCode"/>
														<xsl:if test="rstvha:TransportMean/rstvha:ProductCode and rstvha:TransportMean/rstvha:Tnved">
															<xsl:text> / </xsl:text>
														</xsl:if>
														<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tnved"/>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ЗАЯВИТЕЛЬ И ЕГО АДРЕС
													</td>
													<td class="bordered ib">
														<xsl:apply-templates mode="org" select="rstvha:Applicant"/>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ИЗГОТОВИТЕЛЬ И ЕГО АДРЕС
													</td>
													<td class="bordered ib">
														<xsl:for-each select="rstvha:TransportMean/rstvha:Manufacturer">
															<xsl:if test="position() &gt; 1">
																<br/>
																<br/>
															</xsl:if>
															<xsl:apply-templates mode="org" select="."/>
														</xsl:for-each>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ПРЕДСТАВИТЕЛЬ ИЗГОТОВИТЕЛЯ И ЕГО АДРЕС
													</td>
													<td class="bordered ib">
														<xsl:choose>
															<xsl:when test="rstvha:TransportMean/rstvha:ManufacturerAgent">
																<xsl:apply-templates mode="org" select="rstvha:TransportMean/rstvha:ManufacturerAgent"/>
															</xsl:when>
															<xsl:otherwise> -- </xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													СБОРОЧНЫЙ(Е) ЗАВОД(Ы) И ЕГО (ИХ) АДРЕС(А)
													</td>
													<td class="bordered ib">
														<xsl:for-each select="rstvha:TransportMean/rstvha:AssemblyPlant">
															<xsl:if test="position() &gt; 1">
																<br/>
																<br/>
															</xsl:if>
															<xsl:apply-templates mode="org" select="."/>
														</xsl:for-each>
													</td>
												</tr>
												<tr valign="top">
													<td class="bordered">
													ПОСТАВЩИК(И) СБОРОЧНЫХ КОМПЛЕКТОВ И ЕГО (ИХ) АДРЕС(А)
													</td>
													<td class="bordered ib">
														<xsl:for-each select="rstvha:TransportMean/rstvha:Supplier">
															<xsl:if test="position() &gt; 1">
																<br/>
																<br/>
															</xsl:if>
															<xsl:apply-templates mode="org" select="."/>
														</xsl:for-each>
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
									<td align="center">
										ОБЩИЕ ХАРАКТЕРИСТИКИ ТРАНСПОРТНОГО СРЕДСТВА
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Количество  и расположение колес (только для транспортных средств категории L)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:WheelsInfoKatL"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Количество осей/колес (только для транспортных средств категории O)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:WheelsInfoKatO"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Колесная формула/ведущие  колеса  (за  исключением  транспортных  средств категории O)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:WheelsInfoNotKatO"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Схема компоновки  транспортного  средства  (за  исключением  транспортных средств категории O)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:VehicleLayout"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Расположение двигателя
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EngineLocation"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Тип кузова/количество дверей (только для транспортных средств категории M)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:VehicleBody"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Исполнение  загрузочного  пространства  (только  для  транспортных  средств категорий N и O)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:BootSpaceExecution"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Назначение   (только  для  специальных  и  специализированных  транспортных средств)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:VehicleFunction"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Количество  мест для сидения (только для транспортных средств категорий M и L, для транспортных средств категории М<sub>1</sub> - с распределением по рядам)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:NumberSeats"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Пассажировместимость (только для транспортных средств категорий М<sub>2</sub> и М<sub>3</sub>)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:PassengerCapacity"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Общий  объем  багажных отделений (только для транспортных средств категории М<sub>3</sub> класса III)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:TotalLuggageSpace"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Кабина (только для транспортных средств категории N)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Cabin"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Рама (только для транспортных средств категории L)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Frame"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Габаритные размеры, мм
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- длина
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:DimensionInfo/rstvha:Lenght"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- ширина
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:DimensionInfo/rstvha:Wight"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- высота (для контейнеровозов - погрузочная, максимальная допустимая)
									</td>
									<td class="bordered" width="50%">
										<xsl:text> погрузочная </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:DimensionInfo/rstvha:Height"/>
										<br/>
										<xsl:text>максимальная допустимая: </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:DimensionInfo/rstvha:MaxHeight"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">База, мм
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Колея  передних/задних  колес  (за  исключением  одноколейных  транспортных средств категории L), мм
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:FrontTrack"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:BackTrack"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Масса транспортного средства в снаряженном состоянии, кг
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:VehicleMass"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Технически допустимая максимальная масса транспортного средства, кг
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:VehicleMaxMass"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Технически  допустимая  максимальная  масса, приходящаяся на каждую из осей транспортного средства, начиная с передней оси, кг
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:VehicleMaxMassAxle"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Технически   допустимая   максимальная   масса   автопоезда   (только   для транспортных средств категории N), кг
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:RoadTrainMaxMass"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Максимальная масса прицепа, кг
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean/rstvha:TrailerNotBrakeMaxMass"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- прицеп без тормозной системы
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:TrailerNotBrakeMaxMass"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- прицеп с тормозной системой
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:TrailerBrakeMaxMass"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Технически  допустимая максимальная нагрузка на опорно-сцепное  устройство, даН
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:MaxLoadFifthWheel"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Описание гибридного транспортного средства:
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean/rstvha:HybridVehicle"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">предусмотрена или не предусмотрена подзарядка от внешнего источника;
									</td>
									<td class="bordered" width="50%">
										<xsl:variable name="xpath_date">
											<xsl:call-template name="get_xpath">
												<xsl:with-param name="node" select="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:Recharging"/>
											</xsl:call-template>
										</xsl:variable>
										<element xml_node="{$xpath_date}">
											<xsl:choose>
												<xsl:when test="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:Recharging = 1 or rstvha:TransportMean/rstvha:HybridVehicle/rstvha:Recharging = 'true'">предусмотрена</xsl:when>
												<xsl:otherwise>не предусмотрена</xsl:otherwise>
											</xsl:choose>
										</element>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">предусмотренные  режимы  работы (перечислить): только двигатель внутреннего сгорания,  только  электродвигатель,  совмещенный  (краткое  описание этого режима работы)
									</td>
									<td class="bordered" width="50%">
										<xsl:variable name="xpath_date">
											<xsl:call-template name="get_xpath">
												<xsl:with-param name="node" select="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:OperatingModes"/>
											</xsl:call-template>
										</xsl:variable>
										<element xml_node="{$xpath_date}">
											<xsl:choose>
												<xsl:when test="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:OperatingModes=0">только двигатель внутреннего сгорания</xsl:when>
												<xsl:when test="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:OperatingModes=1">только электродвигатель</xsl:when>
												<xsl:when test="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:OperatingModes=2">
													совмещенный
													<xsl:if test="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:CombinedMode">
														<br/>
														<xsl:value-of select="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:CombinedMode"/>
													</xsl:if>
												</xsl:when>
											</xsl:choose>
										</element>
										
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Двигатель внутреннего сгорания (марка, тип)</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:BrandEngine"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:TypeEngine"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- количество и расположение цилиндров
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:Cylinders"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- рабочий объем цилиндров, см3
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:EngineVolumeQuanity"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- степень сжатия
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:CompressionRatio"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- максимальная мощность, кВт (мин.-1)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:EngineMaxPowerMeasure"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- максимальный крутящий момент, Н-м (мин.-1)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:EngineMaxTorque"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Топливо
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:Fuel"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Система питания (тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:PowerSystem"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Карбюратор (тип, маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:CarburetorKind"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:CarburetorMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Блок управления (маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ControlBlock"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">ТНВД (тип, маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:HPFPKind"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:HPFPMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Форсунки (тип, маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:NozzlesKind"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:NozzlesMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Нагнетатель воздуха (тип, маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:AirBlowerKind"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:AirBlowerMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Воздушный фильтр (тип, маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:AirFilterKind"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:AirFilterMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Глушители шума впуска (маркировка)
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- 1 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:IntakeSilencers/rstvha:Stage1Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- 2 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:IntakeSilencers/rstvha:Stage2Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- 3 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:IntakeSilencers/rstvha:Stage3Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Система зажигания (тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:IgnitionSystemKind"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Распределитель (маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:DistributorMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Коммутатор (маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:CommutatorMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Катушка (модуль) зажигания (маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:IgnitionCoilMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Свечи (маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:CandlesMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Система выпуска и нейтрализации отработавших газов
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean/rstvha:ExhaustSystemGas/rstvha:Neutralizers/rstvha:Stage1Mark"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Нейтрализаторы (маркировка) - 1 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ExhaustSystemGas/rstvha:Neutralizers/rstvha:Stage1Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- 2 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ExhaustSystemGas/rstvha:Neutralizers/rstvha:Stage2Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Глушители (маркировка) - 1 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ExhaustSystemGas/rstvha:IntakeSilencers/rstvha:Stage1Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- 2 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ExhaustSystemGas/rstvha:IntakeSilencers/rstvha:Stage2Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- 3 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ExhaustSystemGas/rstvha:IntakeSilencers/rstvha:Stage3Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Фильтр твердых частиц
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ExhaustSystemGas/rstvha:ParticulateFilter"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Электродвигатель электромобиля (марка, тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ElectricEngine/rstvha:BrandEngine"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ElectricEngine/rstvha:TypeEngine"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Рабочее напряжение, В
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ElectricEngine/rstvha:OperatingVoltage"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Максимальная 30-минутная мощность, кВт
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ElectricEngine/rstvha:EngineMaxPowerMeasure"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Устройство накопления энергии
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Батарея (марка, тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:BrandBattery"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:TypeBattery"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Электрохимическая пара
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:ElChemicSteam"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Количество элементов
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:QuantityEl"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Масса, кг
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:Mass"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Рабочее напряжение, В
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:OperatingVoltage"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Емкость, А-ч
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:Capacity"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Место расположения
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:Location"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Конденсатор (марка, тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:BrandCapacitor"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:TypeCapacitor"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Энергоемкость, Дж
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:EnergyIntensity"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Маховик/генератор (марка, тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:BrandGenerator"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:TypeGenerator"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Запас хода, км
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:PowerReserve"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Трансмиссия
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Электромашина (марка, тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:BrandElectricMachine"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:TypeElectricMachine"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Рабочее напряжение, В
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:OperatingVoltage"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Максимальная 30-минутная мощность, кВт
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:EngineMaxPowerMeasure"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Сцепление (марка, тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:BrandClutch"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:TypeClutch"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Коробка передач (марка, тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:BrandGearbox"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:TypeGearbox"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">число передач и передаточные числа
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:GearRatios"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Раздаточная коробка (тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:TypeTransferBox"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">число передач и передаточные числа
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:GearRatiosTransferBox"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Главная передача (тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:MainGear/rstvha:TypeMainGear"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- передаточное число
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:MainGear/rstvha:GearRatio"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- передаточное число промежуточной передачи
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:MainGear/rstvha:IntermediateGearRatio"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Подвеска
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Передняя (описание)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:FrontSuspension"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Задняя (описание)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:BackSuspension"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Рулевое управление (описание)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Steering/rstvha:Description"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- рулевой механизм (тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Steering/rstvha:TypeMechanism"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Тормозные системы
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Рабочая (описание)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:BrakeSystems/rstvha:Working"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Запасная (описание)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:BrakeSystems/rstvha:Spare"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Стояночная (описание)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:BrakeSystems/rstvha:Parking"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Вспомогательная (износостойкая) (описание)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:BrakeSystems/rstvha:Auxiliary"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Шины
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- обозначение размера
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tyres/rstvha:SizeDesign"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- индекс несущей способности для максимально допустимой нагрузки
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tyres/rstvha:LoadCapacityIndex"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- обозначение категории скорости
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tyres/rstvha:SpeedCategoryDesign"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Оборудование транспортного средства
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Equipment"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<xsl:text>соответствуют требованиям технического регламента Таможенного союза "О безопасности колесных транспортных средств".</xsl:text>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr>
									<td>
										<xsl:text>ДОПОЛНИТЕЛЬНАЯ ИНФОРМАЦИЯ </xsl:text>
										<br/>
										<xsl:apply-templates select="rstvha:TCtypeApprovalsAddition"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td align="right">
										<xsl:text>Дата оформления </xsl:text>
										<xsl:apply-templates select="rstvha:IssueDate" mode="date_month"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<!-- подвал -->
						<br/>
						<table>
							<tbody>
								<tr valign="bottom">
									<td width="30%">Руководитель испытательной лаборатории</td>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;"/>
									<td width="5%"/>
									<td width="30%" style="border-bottom: 1px solid black;" align="center">
										<xsl:apply-templates select="rstvha:RegisterSignature" mode="person_signature_inits"/>
									</td>
								</tr>
								<tr align="center">
									<td/>
									<td/>
									<td style="font-size:8pt;">подпись</td>
									<td/>
									<td style="font-size:8pt;">инициалы, фамилия</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				
				<!-- Приложение для 0 и 1 -->
				<xsl:if test="(rstvha:DocKind = 0 or rstvha:DocKind = 1) and (rstvha:TransportMean/rstvha:SeriesSign = 1 or rstvha:TransportMean/rstvha:SeriesSign =  2)">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td class="bordered" align="center" valign="middle">
										<b>
											<xsl:text>Система сертификации ГОСТ Р</xsl:text>
											<br/>
											<xsl:text>Федеральное агентство по техническому регулированию и метрологии</xsl:text>
										</b>
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<table>
											<tbody>
												<tr>
													<td width="80%"/>
													<td width="20%">
														<xsl:text>N </xsl:text>
														<xsl:apply-templates select="rstvha:BlankNumber"/>
													</td>
												</tr>
											</tbody>
										</table>
										<table>
											<tbody>
												<tr>
													<td align="center">
														<br/>
														<br/>
														<xsl:text>ПРИЛОЖЕНИЕ</xsl:text>
														<br/>
														<xsl:text>к сертификату соответствия № </xsl:text>
														<span style="border-bottom:1px solid black;">
															<xsl:apply-templates select="rstvha:DocId"/>
														</span>
														<br/>
														<br/>
														<xsl:text>Перечень конкретной продукции, на которую распространяется</xsl:text>
														<br/>
														<xsl:text>действие сертификата соответствия</xsl:text>
													</td>
												</tr>
											</tbody>
										</table>
										<table>
											<tbody>
												<tr>
													<td class="bordered">
														Код ОК 005 (ОКП)
														<br/>
														Код ТН ВЭД России
													</td>
													<td class="bordered">
														Наименование и обозначение<br/>
														продукции, изготовитель
													</td>
													<td class="bordered">
														Обозначение документации,<br/>
														по которой выпускается продукция
													</td>
												</tr>
												<xsl:for-each select="rstvha:TransportMean">
													<tr valign="top">
														<td class="bordered">
															<xsl:apply-templates select="rstvha:ProductCode"/>
															<br/>
															<xsl:apply-templates select="rstvha:Tnved"/>
														</td>
														<td class="bordered">
															<xsl:apply-templates select="."/>
															<br/>
															<xsl:apply-templates select="./rstvha:ManufacturerAgent"/>
														</td>
														<td class="bordered">
															<xsl:for-each select="rstvha:ShippingDocuments">
																<xsl:if test="position() &gt; 1">
																	<br/>
																</xsl:if>
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
										<!-- подвал -->
										<br/>
										<table>
											<tbody>
												<tr valign="bottom">
													<td width="30%">Руководитель органа</td>
													<td width="5%"/>
													<td width="30%" style="border-bottom: 1px solid black;"/>
													<td width="5%"/>
													<td width="30%" style="border-bottom: 1px solid black;" align="center">
														<xsl:apply-templates select="rstvha:RegisterSignature" mode="person_signature"/>
													</td>
												</tr>
												<tr align="center">
													<td/>
													<td/>
													<td style="font-size:8pt;">подпись</td>
													<td/>
													<td style="font-size:8pt;">инициалы, фамилия</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr>
													<td>М.П.</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr valign="bottom">
													<td width="30%">Эксперт</td>
													<td width="5%"/>
													<td width="30%" style="border-bottom: 1px solid black;"/>
													<td width="5%"/>
													<td width="30%" style="border-bottom: 1px solid black;" align="center">
														<xsl:apply-templates select="rstvha:Expert" mode="person_signature"/>
													</td>
												</tr>
												<tr align="center">
													<td/>
													<td/>
													<td style="font-size:8pt;">подпись</td>
													<td/>
													<td style="font-size:8pt;">инициалы, фамилия</td>
												</tr>
											</tbody>
										</table>
										<br/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<!-- Приложения для 2 -->
				<xsl:if test="rstvha:DocKind = 2 or rstvha:DocKind = 3">
					<!-- Приложение № 1 -->
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td align="right">
											Приложение N 1<br/>
											к одобрению типа<br/>
											транспортного средства N <xsl:apply-templates select="rstvha:DocId"/>
										<br/>
										<br/>
											Стр. ____
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<br/>
										ОБЩИЕ ХАРАКТЕРИСТИКИ ТРАНСПОРТНОГО СРЕДСТВА
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Количество  и расположение колес (только для транспортных средств категории L)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:WheelsInfoKatL"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Количество осей/колес (только для транспортных средств категории O)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:WheelsInfoKatO"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Колесная формула/ведущие  колеса  (за  исключением  транспортных  средств категории O)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:WheelsInfoNotKatO"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Схема компоновки  транспортного  средства  (за  исключением  транспортных средств категории O)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:VehicleLayout"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Расположение двигателя
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EngineLocation"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Тип кузова/количество дверей (только для транспортных средств категории M)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:VehicleBody"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Исполнение  загрузочного  пространства  (только  для  транспортных  средств категорий N и O)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:BootSpaceExecution"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Назначение   (только  для  специальных  и  специализированных  транспортных средств)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:VehicleFunction"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Количество  мест для сидения (только для транспортных средств категорий M и L, для транспортных средств категории М<sub>1</sub> - с распределением по рядам)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:NumberSeats"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Пассажировместимость (только для транспортных средств категорий М<sub>2</sub> и М<sub>3</sub>)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:PassengerCapacity"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Общий  объем  багажных отделений (только для транспортных средств категории М<sub>3</sub> класса III)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:TotalLuggageSpace"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Кабина (только для транспортных средств категории N)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Cabin"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Рама (только для транспортных средств категории L)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Frame"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Габаритные размеры, мм
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- длина
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:DimensionInfo/rstvha:Lenght"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- ширина
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:DimensionInfo/rstvha:Wight"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- высота (для контейнеровозов - погрузочная, максимальная допустимая)
									</td>
									<td class="bordered" width="50%">
										<xsl:text> погрузочная </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:DimensionInfo/rstvha:Height"/>
										<br/>
										<xsl:text>максимальная допустимая: </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:DimensionInfo/rstvha:MaxHeight"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">База, мм
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Колея  передних/задних  колес  (за  исключением  одноколейных  транспортных средств категории L), мм
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:FrontTrack"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:BackTrack"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Масса транспортного средства в снаряженном состоянии, кг
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:VehicleMass"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Технически допустимая максимальная масса транспортного средства, кг
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:VehicleMaxMass"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Технически  допустимая  максимальная  масса, приходящаяся на каждую из осей транспортного средства, начиная с передней оси, кг
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:VehicleMaxMassAxle"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Технически   допустимая   максимальная   масса   автопоезда   (только   для транспортных средств категории N), кг
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:RoadTrainMaxMass"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Максимальная масса прицепа, кг
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean/rstvha:TrailerNotBrakeMaxMass"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- прицеп без тормозной системы
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:TrailerNotBrakeMaxMass"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- прицеп с тормозной системой
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:TrailerBrakeMaxMass"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Технически  допустимая максимальная нагрузка на опорно-сцепное  устройство, даН
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:MaxLoadFifthWheel"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Описание гибридного транспортного средства:
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean/rstvha:HybridVehicle"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">предусмотрена или не предусмотрена подзарядка от внешнего источника;
									</td>
									<td class="bordered" width="50%">
										<xsl:variable name="xpath_date">
											<xsl:call-template name="get_xpath">
												<xsl:with-param name="node" select="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:Recharging"/>
											</xsl:call-template>
										</xsl:variable>
										<element xml_node="{$xpath_date}">
											<xsl:choose>
												<xsl:when test="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:Recharging = 1 or rstvha:TransportMean/rstvha:HybridVehicle/rstvha:Recharging = 'true'">предусмотрена</xsl:when>
												<xsl:otherwise>не предусмотрена</xsl:otherwise>
											</xsl:choose>
										</element>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">предусмотренные  режимы  работы (перечислить): только двигатель внутреннего сгорания,  только  электродвигатель,  совмещенный  (краткое  описание этого режима работы)
									</td>
									<td class="bordered" width="50%">
										<xsl:variable name="xpath_date">
											<xsl:call-template name="get_xpath">
												<xsl:with-param name="node" select="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:OperatingModes"/>
											</xsl:call-template>
										</xsl:variable>
										<element xml_node="{$xpath_date}">
											<xsl:choose>
												<xsl:when test="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:OperatingModes=0">только двигатель внутреннего сгорания</xsl:when>
												<xsl:when test="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:OperatingModes=1">только электродвигатель</xsl:when>
												<xsl:when test="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:OperatingModes=2">
													совмещенный
													<xsl:if test="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:CombinedMode">
														<br/>
														<xsl:value-of select="rstvha:TransportMean/rstvha:HybridVehicle/rstvha:CombinedMode"/>
													</xsl:if>
												</xsl:when>
											</xsl:choose>
										</element>
										
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Двигатель внутреннего сгорания (марка, тип)</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:BrandEngine"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:TypeEngine"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- количество и расположение цилиндров
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:Cylinders"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- рабочий объем цилиндров, см3
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:EngineVolumeQuanity"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- степень сжатия
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:CompressionRatio"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- максимальная мощность, кВт (мин.-1)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:EngineMaxPowerMeasure"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- максимальный крутящий момент, Н-м (мин.-1)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:EngineMaxTorque"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Топливо
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:InternalCombustionEngine/rstvha:Fuel"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Система питания (тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:PowerSystem"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Карбюратор (тип, маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:CarburetorKind"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:CarburetorMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Блок управления (маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ControlBlock"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">ТНВД (тип, маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:HPFPKind"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:HPFPMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Форсунки (тип, маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:NozzlesKind"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:NozzlesMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Нагнетатель воздуха (тип, маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:AirBlowerKind"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:AirBlowerMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Воздушный фильтр (тип, маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:AirFilterKind"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:AirFilterMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Глушители шума впуска (маркировка)
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- 1 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:IntakeSilencers/rstvha:Stage1Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- 2 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:IntakeSilencers/rstvha:Stage2Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- 3 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:IntakeSilencers/rstvha:Stage3Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Система зажигания (тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:IgnitionSystemKind"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Распределитель (маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:DistributorMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Коммутатор (маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:CommutatorMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Катушка (модуль) зажигания (маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:IgnitionCoilMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Свечи (маркировка)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:CandlesMark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Система выпуска и нейтрализации отработавших газов
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean/rstvha:ExhaustSystemGas/rstvha:Neutralizers/rstvha:Stage1Mark"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Нейтрализаторы (маркировка) - 1 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ExhaustSystemGas/rstvha:Neutralizers/rstvha:Stage1Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- 2 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ExhaustSystemGas/rstvha:Neutralizers/rstvha:Stage2Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Глушители (маркировка) - 1 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ExhaustSystemGas/rstvha:IntakeSilencers/rstvha:Stage1Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- 2 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ExhaustSystemGas/rstvha:IntakeSilencers/rstvha:Stage2Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- 3 ступень
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ExhaustSystemGas/rstvha:IntakeSilencers/rstvha:Stage3Mark"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Фильтр твердых частиц
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ExhaustSystemGas/rstvha:ParticulateFilter"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Электродвигатель электромобиля (марка, тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ElectricEngine/rstvha:BrandEngine"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ElectricEngine/rstvha:TypeEngine"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Рабочее напряжение, В
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ElectricEngine/rstvha:OperatingVoltage"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Максимальная 30-минутная мощность, кВт
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:ElectricEngine/rstvha:EngineMaxPowerMeasure"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Устройство накопления энергии
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Батарея (марка, тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:BrandBattery"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:TypeBattery"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Электрохимическая пара
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:ElChemicSteam"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Количество элементов
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:QuantityEl"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Масса, кг
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:Mass"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Рабочее напряжение, В
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:OperatingVoltage"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Емкость, А-ч
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:Capacity"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Место расположения
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:Location"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Конденсатор (марка, тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:BrandCapacitor"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:TypeCapacitor"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Энергоемкость, Дж
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:EnergyIntensity"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Маховик/генератор (марка, тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:BrandGenerator"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:TypeGenerator"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Запас хода, км
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:EnergyStorageDevice/rstvha:PowerReserve"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Трансмиссия
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Электромашина (марка, тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:BrandElectricMachine"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:TypeElectricMachine"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Рабочее напряжение, В
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:OperatingVoltage"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Максимальная 30-минутная мощность, кВт
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:EngineMaxPowerMeasure"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Сцепление (марка, тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:BrandClutch"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:TypeClutch"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Коробка передач (марка, тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:BrandGearbox"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:TypeGearbox"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">число передач и передаточные числа
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:GearRatios"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Раздаточная коробка (тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:TypeTransferBox"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">число передач и передаточные числа
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:GearRatiosTransferBox"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Главная передача (тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:MainGear/rstvha:TypeMainGear"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- передаточное число
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:MainGear/rstvha:GearRatio"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- передаточное число промежуточной передачи
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Transmission/rstvha:MainGear/rstvha:IntermediateGearRatio"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Подвеска
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Передняя (описание)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:FrontSuspension"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Задняя (описание)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:BackSuspension"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Рулевое управление (описание)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Steering/rstvha:Description"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- рулевой механизм (тип)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Steering/rstvha:TypeMechanism"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Тормозные системы
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Рабочая (описание)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:BrakeSystems/rstvha:Working"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Запасная (описание)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:BrakeSystems/rstvha:Spare"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Стояночная (описание)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:BrakeSystems/rstvha:Parking"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Вспомогательная (износостойкая) (описание)
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:BrakeSystems/rstvha:Auxiliary"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Шины
									</td>
									<td class="bordered" width="50%">
										<!--xsl:value-of select="rstvha:TransportMean"/-->
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- обозначение размера
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tyres/rstvha:SizeDesign"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- индекс несущей способности для максимально допустимой нагрузки
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tyres/rstvha:LoadCapacityIndex"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">- обозначение категории скорости
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Tyres/rstvha:SpeedCategoryDesign"/>
									</td>
								</tr>
								<tr align="left" valign="top">
									<td class="bordered" width="50%">Оборудование транспортного средства
									</td>
									<td class="bordered" width="50%">
										<xsl:apply-templates select="rstvha:TransportMean/rstvha:Equipment"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr valign="bottom">
									<td width="48%">Руководитель органа по сертификации</td>
									<td width="1%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="1%"/>
									<td width="30%" style="border-bottom: 1px solid black;" align="center">
										<xsl:apply-templates select="rstvha:RegisterSignature" mode="person_signature"/>
									</td>
								</tr>
								<tr align="center">
									<td/>
									<td/>
									<td style="font-size:8pt;">подпись</td>
									<td/>
									<td style="font-size:8pt;">инициалы, фамилия</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td width="80%"></td>
									<td align="center" width="20%" style="border-bottom: 1px solid black;">
										<xsl:apply-templates select="rstvha:BlankNumber"/>
									</td>
								</tr>
								<tr>
									<td></td>
									<td style="font-size: 8pt;">(учетный номер бланка)</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Приложение № 2 -->
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td align="right">
											Приложение N 2<br/>
											к одобрению типа<br/>
											транспортного средства N <xsl:apply-templates select="rstvha:DocId"/>
										<br/>
										<br/>
											Стр. ____
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<br/>
										Перечень<br/>
										документов, явившихся основанием для оформления<br/>
										ОДОБРЕНИЯ ТИПА ТРАНСПОРТНОГО СРЕДСТВА
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr align="center" valign="top">
									<td class="bordered">Элементы объектов технического регулирования, в отношении которых установлены требования безопасности</td>
									<td class="bordered">Наименование и происхождение документа, подтверждающего соответствие</td>
									<td class="bordered">Номер документа и дата выпуска</td>
								</tr>
								<xsl:for-each select="rstvha:ApprovalBaseDocuments">
									<tr valign="top">
										<td class="bordered">
											<xsl:apply-templates select="rstvha:ElementsObjTechnReg"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="rstvha:NameAndOriginDoc"/>
										</td>
										<td class="bordered">
											<xsl:if test="rstvha:DocumentNumber">
												<xsl:text> № </xsl:text>
												<xsl:apply-templates select="rstvha:DocumentNumber"/>
											</xsl:if>
											<xsl:if test="rstvha:DocumentDate">
												<xsl:text> от </xsl:text>
												<xsl:apply-templates select="rstvha:DocumentDate" mode="russian_date"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
						<p>
							Допускается   установка   шин,   соответствующих   критериям   размерности, минимально допустимого индекса нагрузки, минимальной скоростной категории и имеющих  отличные  от  указанных подтверждающие соответствие документы, при наличии  на  шинах  маркировки  по  Правилам  ООН  N  30 или 54, а также по Правилам  ООН  N  117  при  условии  представления  в орган по сертификации информации об указанной маркировке.
						</p>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr valign="bottom">
									<td width="48%">Руководитель органа по сертификации</td>
									<td width="1%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="1%"/>
									<td width="30%" style="border-bottom: 1px solid black;" align="center">
										<xsl:apply-templates select="rstvha:RegisterSignature" mode="person_signature"/>
									</td>
								</tr>
								<tr align="center">
									<td/>
									<td/>
									<td style="font-size:8pt;">подпись</td>
									<td/>
									<td style="font-size:8pt;">инициалы, фамилия</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td width="80%"></td>
									<td align="center" width="20%" style="border-bottom: 1px solid black;">
										<xsl:apply-templates select="rstvha:BlankNumber"/>
									</td>
								</tr>
								<tr>
									<td></td>
									<td style="font-size: 8pt;">(учетный номер бланка)</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Приложение № 3 -->
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td align="right">
											Приложение N 3<br/>
											к одобрению типа<br/>
											транспортного средства N <xsl:apply-templates select="rstvha:DocId"/>
										<br/>
										<br/>
											Стр. ____
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<br/>
										ОПИСАНИЕ МАРКИРОВКИ ТРАНСПОРТНОГО СРЕДСТВА
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<p>1. Место расположения и форма единого знака обращения на рынке государств - членов Таможенного союза: <xsl:apply-templates select="rstvha:VehicleLabel/rstvha:LocationSingleSign"/></p>
						<p>2. Место расположения таблички изготовителя: <xsl:apply-templates select="rstvha:VehicleLabel/rstvha:ManufNameplateLocation"/></p>
						<p>3. Место расположения идентификационного номера: <br/>
							<xsl:for-each select="rstvha:VehicleLabel/rstvha:IDNumberLocation">
								<xsl:if test="position() &gt; 1"><br/></xsl:if>
								<xsl:text>3.</xsl:text><xsl:value-of select="position()"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</p>
						<p>4.  Структура и содержание идентификационного номера (номеров) транспортных средств:</p>
						<table>
							<tbody>
								<tr align="center" valign="middle">
									<td class="bordered">1</td>
									<td class="bordered">2</td>
									<td class="bordered">3</td>
									<td class="bordered">4</td>
									<td class="bordered">5</td>
									<td class="bordered">6</td>
									<td class="bordered">7</td>
									<td class="bordered">8</td>
									<td class="bordered">9</td>
									<td class="bordered">10</td>
									<td class="bordered">11</td>
									<td class="bordered">12</td>
									<td class="bordered">13</td>
									<td class="bordered">14</td>
									<td class="bordered">15</td>
									<td class="bordered">16</td>
									<td class="bordered">17</td>
								</tr>
								<xsl:for-each select="rstvha:VehicleLabel/rstvha:IDNumber">
									<tr align="center" valign="middle">
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'1'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'2'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'3'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'4'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'5'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'6'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'7'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'8'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'9'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'10'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'11'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'12'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'13'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'14'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'15'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'16'"/></xsl:apply-templates></td>
										<td class="bordered"><xsl:apply-templates select="." mode="getChar"><xsl:with-param name="charPos" select="'17'"/></xsl:apply-templates></td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<p>
							<xsl:for-each select="rstvha:VehicleLabel/rstvha:IDNumberContents">
								<xsl:if test="position() &gt; 1"><br/></xsl:if>
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</p>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr valign="bottom">
									<td width="48%">Руководитель органа по сертификации</td>
									<td width="1%"/>
									<td width="20%" style="border-bottom: 1px solid black;"/>
									<td width="1%"/>
									<td width="30%" style="border-bottom: 1px solid black;" align="center">
										<xsl:apply-templates select="rstvha:RegisterSignature" mode="person_signature"/>
									</td>
								</tr>
								<tr align="center">
									<td/>
									<td/>
									<td style="font-size:8pt;">подпись</td>
									<td/>
									<td style="font-size:8pt;">инициалы, фамилия</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td width="80%"></td>
									<td align="center" width="20%" style="border-bottom: 1px solid black;">
										<xsl:apply-templates select="rstvha:BlankNumber"/>
									</td>
								</tr>
								<tr>
									<td></td>
									<td style="font-size: 8pt;">(учетный номер бланка)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="*" mode="getChar">
		<xsl:param name="charPos"/>
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="substring(., number($charPos), 1)"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="org">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text> ОКПО </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text> УНН </xsl:text>
			<xsl:apply-templates select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text> НЗОУ </xsl:text>
			<xsl:apply-templates select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text> УНП </xsl:text>
			<xsl:apply-templates select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text> ИНФЛ </xsl:text>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text> БИН </xsl:text>
			<xsl:apply-templates select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text> ИИН </xsl:text>
			<xsl:apply-templates select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text> ИТН </xsl:text>
			<xsl:for-each select="cat_ru:ITN/*">
				<xsl:if test="position() &gt;1">
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
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
	<xsl:template match="*" mode="person_signature">
		<xsl:apply-templates select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
	</xsl:template>
	<xsl:template match="*" mode="person_signature_inits">
		<xsl:apply-templates select="cat_ru:PersonName" mode="getChar"><xsl:with-param name="charPos" select="'1'"/></xsl:apply-templates>
		<xsl:text>.</xsl:text>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:apply-templates select="cat_ru:PersonMiddleName" mode="getChar"><xsl:with-param name="charPos" select="'1'"/></xsl:apply-templates>
			<xsl:text>.</xsl:text>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
	</xsl:template>
	<xsl:template match="rstvha:BaseDocuments">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="rstvha:Manufacturer | rstvha:ManufacturerAgent">
		<xsl:if test="position() &gt; 1">; </xsl:if>
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="RUScat_ru:PersonId"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="rstvha:TransportMean">
		<xsl:apply-templates select="rstvha:TCtradeName"/>
		<xsl:if test="rstvha:Tctype">
			<xsl:text> тип: </xsl:text>
			<xsl:apply-templates select="rstvha:Tctype"/>
		</xsl:if>
		<xsl:if test="rstvha:Vctype">
			<xsl:text> вид: </xsl:text>
			<xsl:apply-templates select="rstvha:Vctype"/>
		</xsl:if>
		<xsl:if test="rstvha:Tcbrand">
			<xsl:text> марка: </xsl:text>
			<xsl:apply-templates select="rstvha:Tcbrand"/>
		</xsl:if>
		<xsl:if test="rstvha:Standard">
			<xsl:text> стандарт: </xsl:text>
			<xsl:apply-templates select="rstvha:Standard"/>
		</xsl:if>
		<xsl:if test="rstvha:SeriesSign">
			<xsl:variable name="xpath_date">
				<xsl:call-template name="get_xpath">
					<xsl:with-param name="node" select="rstvha:SeriesSign"/>
				</xsl:call-template>
			</xsl:variable>
			<element xml_node="{$xpath_date}">
				<xsl:choose>
					<xsl:when test="rstvha:SeriesSign=1">
						<xsl:text> "единичное изделие" </xsl:text>
					</xsl:when>
					<xsl:when test="rstvha:SeriesSign=2">
						<xsl:text> "партия" </xsl:text>
					</xsl:when>
					<xsl:when test="rstvha:SeriesSign=3">
						<xsl:text> "серийный выпуск" </xsl:text>
					</xsl:when>
				</xsl:choose>
			</element>
		</xsl:if>
		<xsl:if test="rstvha:SerialNumber">
			<xsl:text> номер: </xsl:text>
			<xsl:apply-templates select="rstvha:SerialNumber"/>
		</xsl:if>
		<xsl:if test="rstvha:PartySize">
			<xsl:text> размер: </xsl:text>
			<xsl:apply-templates select="rstvha:PartySize"/>
		</xsl:if>
		<xsl:if test="rstvha:ShippingDocuments">
			<xsl:text> документы: </xsl:text>
			<xsl:for-each select="rstvha:ShippingDocuments">
				<xsl:if test="position() &gt; 1">; </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="rstvha:ShippingDocuments">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="rstvha:CertificateOrg | rstvha:Applicant" mode="otts">
		<xsl:text> </xsl:text>
		<span style="text-transform: uppercase">
			<xsl:apply-templates select="cat_ru:OrganizationName"/>
			<xsl:if test="cat_ru:ShortName">
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="cat_ru:ShortName"/>
			</xsl:if>
		</span>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<span style="text-transform: lowercase">
				<xsl:text> Адрес(а): </xsl:text>
				<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails"/>
			</span>
		</xsl:if>
		<!--xsl:apply-templates select="RUScat_ru:CommunicationDetails"/-->
		<xsl:if test="rstvha:DocumentNumber">
			<xsl:text> Аттестат N </xsl:text>
			<xsl:apply-templates select="rstvha:DocumentNumber"/>
		</xsl:if>
		<xsl:if test="rstvha:DocumentDate">
			<xsl:text> действует по </xsl:text>
			<xsl:apply-templates select="rstvha:DocumentDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="rstvha:CertificateOrg | rstvha:Applicant" mode="otts2">
		<xsl:text> </xsl:text>
		<span style="text-transform: uppercase;" class="ib">
			<xsl:apply-templates select="cat_ru:OrganizationName"/>
			<xsl:if test="cat_ru:ShortName">
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="cat_ru:ShortName"/>
			</xsl:if>
		</span>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<span style="text-transform: lowercase">
				<xsl:text> Адрес(а): </xsl:text>
				<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails"/>
			</span>
		</xsl:if>
		<xsl:if test="rstvha:DocumentNumber">
			<xsl:text> Аттестат N </xsl:text>
			<xsl:apply-templates select="rstvha:DocumentNumber"/>
		</xsl:if>
		<xsl:if test="rstvha:DocumentDate">
			<xsl:text> действует по </xsl:text>
			<xsl:apply-templates select="rstvha:DocumentDate" mode="russian_date"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
	</xsl:template>
	<xsl:template match="rstvha:CertificateOrg | rstvha:Applicant">
		<xsl:text> </xsl:text>
		<span style="text-transform: uppercase">
			<xsl:apply-templates select="cat_ru:OrganizationName"/>
			<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
				<xsl:apply-templates select="cat_ru:ShortName"/>
			</xsl:if>
		</span>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<span style="text-transform: lowercase">
				<xsl:text> Адрес(а): </xsl:text>
				<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails"/>
			</span>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
		<xsl:if test="rstvha:DocumentNumber">
			<xsl:text> Аттестат N </xsl:text>
			<xsl:apply-templates select="rstvha:DocumentNumber"/>
		</xsl:if>
		<xsl:if test="rstvha:DocumentDate">
			<xsl:text> действует по </xsl:text>
			<xsl:apply-templates select="rstvha:DocumentDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:if test="position() &gt; 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:apply-templates select="cat_ru:Fax"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="position() &gt; 1">; </xsl:if>
		<xsl:for-each select="*">
			<xsl:if test="position() &gt; 1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="local-name(.) = 'AddressKindCode'">
					<xsl:variable name="xpath_date">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="."/>
						</xsl:call-template>
					</xsl:variable>
					<element xml_node="{$xpath_date}">
						<xsl:choose>
							<xsl:when test=".=1"> адрес регистрации </xsl:when>
							<xsl:when test=".=2"> фактический адрес </xsl:when>
							<xsl:when test=".=3"> почтовый адрес </xsl:when>
						</xsl:choose>
					</element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:variable name="day" select="substring($dateIn,9,2)"/>
				<xsl:variable name="month" select="substring($dateIn,6,2)"/>
				<xsl:variable name="month_word">
					<xsl:choose>
						<xsl:when test="$month='01'">января</xsl:when>
						<xsl:when test="$month='02'">февраля</xsl:when>
						<xsl:when test="$month='03'">марта</xsl:when>
						<xsl:when test="$month='04'">апреля</xsl:when>
						<xsl:when test="$month='05'">мая</xsl:when>
						<xsl:when test="$month='06'">июня</xsl:when>
						<xsl:when test="$month='07'">июля</xsl:when>
						<xsl:when test="$month='08'">августа</xsl:when>
						<xsl:when test="$month='09'">сентября</xsl:when>
						<xsl:when test="$month='10'">октября</xsl:when>
						<xsl:when test="$month='11'">ноября</xsl:when>
						<xsl:when test="$month='12'">декабря</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="year" select="substring($dateIn,1,4)"/>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="$day"/>
				<xsl:text>" </xsl:text>
				<xsl:value-of select="$month_word"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$year"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,3,1)=':' and substring($dateIn,6,1)=':'">
				<xsl:value-of select="substring($dateIn, 1, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='RosstandartVehicleApproval']//*" priority="-1">
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
	<xsl:template match="*" mode="date_month">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="date_month">
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
	<xsl:template match="*" mode="russian_date_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time">
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
