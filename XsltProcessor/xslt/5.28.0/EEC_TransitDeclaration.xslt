<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:csdo="urn:EEC:M:SimpleDataObjects:v0.4.14" 
	xmlns:ccdo="urn:EEC:M:ComplexDataObjects:v0.4.14" 
	xmlns:casdo="urn:EEC:M:CA:SimpleDataObjects:v1.8.1" 
	xmlns:cacdo="urn:EEC:M:CA:ComplexDataObjects:v1.8.1" 
	xmlns:td="urn:EEC:R:048:TransitDeclaration:v1.0.0"   >
	
	<xsl:param name="TYPE"/><!-- типы ТС -->

	<xsl:variable name="k" select="1"/>
	<xsl:template match="td:TransitDeclaration">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>body {background: #CCCCCC; font-size: 9pt;}
              div.page {
              width: 210mm;
              margin: 10px auto;
              padding: 5mm 10mm;
              background: white;
              border: solid 1px black;
              page-break-before: always;
              }

              div.page_album {
              width: 297mm;
              margin: 10px auto;
              padding: 10mm;
              background: white;
              border: solid 1px black;
              page-break-before: always;
              }

              div.page.nobreak {
              page-break-before: avoid;
              }
              
              /*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
              @media print {div.page {border: none; margin: 0; padding: 0;}}
              div.goods {background: white;}
              .bordered {
              border: solid 1px black;
              padding-top: 4pt;
              padding-bottom: 4pt;
              font-family: Arial;
              font-size: 9pt;
              font-weight: bold;
              }
              .underlined {border-bottom: solid 0.8pt black;}
              p.NumberDate {font-weight: bold;}
              .graph {font-family: Arial; font-size: 7pt;}
              .graphColumn {font-family: Arial; font-size: 6.5pt;}
              .graphTitleIt {font-family: Arial; font-size: 7pt; font-style: italic;}
              .graphMain {font-family: Arial; font-size: 9pt; font-weight: bold; }
              .graphNum {font-family: Arial; font-size: 7pt; font-weight: bold;}
              .graphNo {font-size: 7pt; font-weight: bold;}
              h1{font-size: 12pt;}
              table.addInfo {border-collapse: collapse; vertical-align: top;}
              table.addInfo th {border: 1px solid black; background-color: LightGrey;}
              table.addInfo td {border: 1px solid black; vertical-align: top;}
              hr {border: 0; border-bottom: 1px solid black; margin: 0;}
              .tr {border-right: 1px solid black;}
              .tl {border-left: 1px solid black;}
              .tb {border-bottom: 1px solid black;}
              .tt {border-top: 1px solid black;}
              .br {border-right: 2px solid black;}
              .bl {border-left: 2px solid black;}
              .bb {border-bottom: 2px solid black;}
              .bt {border-top: 2px solid black;}
              .db {border-bottom: 1px dashed black;}
              .dl {border-left: 1px dashed black;}
              .number {
              text-align: center;
              color: black;
              font-size: 11pt;
              font-weight: bold;
              vertical-align: middle;
              }
                </style>
			</head>
			<body>
				<div class="page nobreak">
					<xsl:apply-templates select="cacdo:TDGoodsShipmentDetails[1]"/>
				</div>
				<!--Выводим товары 2 - ..., группируя их по 5 шт. на лист-->
				<xsl:for-each select="cacdo:TDGoodsShipmentDetails[1]/cacdo:TransitGoodsItemDetails">
					<xsl:if test="(position() - 1) mod 5 = 1">
						<xsl:variable name="firstEntryPos" select="position()"/>
						<div class="page">
							<xsl:call-template name="td4Head"/>
							<xsl:for-each select="//cacdo:TDGoodsShipmentDetails[1]/cacdo:TransitGoodsItemDetails">
								<xsl:if test="position() >= $firstEntryPos and position() &lt;= $firstEntryPos + 4">
									<xsl:apply-templates select="."/>
								</xsl:if>
							</xsl:for-each>
							<table cellpadding="0" cellspacing="0" style="width: 100%; margin: 0;">
								<tr>
									<td class="bt" style="vertical-align: top; border: 0.8pt solid black;">
										<br/>
									</td>
								</tr>
							</table>
						</div>
					</xsl:if>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	<!--Товарная партия-->
	<xsl:template match="cacdo:TDGoodsShipmentDetails">
		<xsl:variable name="root" select="./.."/>
		<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt black;">
			<tr>
				<td class="graphMain" colspan="3" style="width:{103*$k}mm;">ТРАНЗИТНАЯ ДЕКЛАРАЦИЯ</td>
				<td style="width:{26.4*$k}mm;"/>
				<td class="graph" style="width:{60.6*$k}mm;border-left:solid 0.8pt black;" valign="top">
					<xsl:text>А. Таможенный орган отправления</xsl:text>
					<br>						<!--xsl:choose>
						<xsl:when test="//*[@DocumentModeID='1006078E']/goom:GTDID">
							<xsl:apply-templates select="//*[@DocumentModeID='1006078E']/goom:GTDID" mode="graf_A"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="//*[@DocumentModeID='1004051E']/nGTDr:GTDID" mode="graf_A"/>
						</xsl:otherwise>
					</xsl:choose-->
					</br>
				</td>
			</tr>
			<tr>
				<td class="graphMain" colspan="3" style="width:{103*$k}mm;">
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>
				<td class="graph" style="width:{26.4*$k}mm;border-top:solid 1pt black;border-left:solid 1pt black;border-right:solid 1pt black;">
					<span class="graphNo">1</span>
					<span class="graph">ДЕКЛАРАЦИЯ</span>
				</td>
				<td class="graph" rowspan="3" style="width:{60.6*$k}mm;border-bottom:solid 0.8pt black;" valign="top">
					<!--xsl:if test="//*[@DocumentModeID='1006078E']/goom:GTDOutCommonMark/catESAD_ru:GRNumber='A' or //*[@DocumentModeID='1006078E']/goom:GTDOutCommonMark/catESAD_ru:GRNumber='А'">
					<xsl:for-each select="//*[@DocumentModeID='1006078E']/goom:GTDOutCommonMark[catESAD_ru:GRNumber='A' or catESAD_ru:GRNumber='А']">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="catESAD_ru:StageMarkIdentifier"/>
						<xsl:text>.</xsl:text>
						<xsl:apply-templates select="catESAD_ru:NoteMarkIdentifier"/>
						<xsl:if test="catESAD_ru:MarkDescription">
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="catESAD_ru:MarkDescription"/>
						</xsl:if>
						<xsl:if test="catESAD_ru:Deadline">
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="catESAD_ru:Deadline" mode="date"/>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="catESAD_ru:Deadline"/>
							</xsl:call-template-->
					<!--/xsl:if>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="catESAD_ru:PersonName"/>
					</xsl:for-each>
				</xsl:if-->
				</td>
			</tr>
			<tr valign="top">
				<td align="center" class="graphNum" style="width:{8*$k}mm;border:solid 1pt black;"></td>
				<td align="center" class="graphNum" style="width:{8*$k}mm;border:solid 1pt black;"></td>
				<td rowspan="3" style="width:{86*$k}mm;border:solid 0.8pt black;background:#FFFFFF;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" style="width:{43*$k}mm;">
								<span class="graphNo">2</span>
								<span class="graph">Отправитель</span>
							</td>
							<td class="graph" style="width:{43*$k}mm;">
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="width:{86*$k}mm;">
								<xsl:apply-templates select="cacdo:ConsignorDetails"/>
							</td>
						</tr>
					</table>
				</td>
				<td style="width:{26.4*$k}mm;border-left:solid 1pt black;border-right:solid 1pt black;border-bottom:solid 1pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td align="center" class="graph" rowspan="2" style="width:{8.8*$k}mm;border-right:solid 0.8pt black;background:#FFFFFF;">
								<xsl:apply-templates select="$root/casdo:DeclarationKindCode"/>
							</td>
							<td align="center" class="graph" rowspan="2" style="width:{4.4*$k}mm;">
								<xsl:apply-templates select="$root/casdo:TransitFeatureCode"/>
							</td>
							<td align="center" class="graph" rowspan="2" style="width:{13.2*$k}mm;border-left:solid 0.8pt black;background:#FFFFFF;">
								<xsl:apply-templates select="$root/casdo:TransitProcedureCode"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td rowspan="8" style="width:{8*$k}mm;border-left:solid 1pt black;border-right:solid 1pt black;"/>
				<td rowspan="8" style="width:{8*$k}mm;border-left:solid 1pt black;border-right:solid 1pt black;"/>
				<td style="width:{26.4*$k}mm;border:solid 0.8pt black;background:#FFFFFF;" valign="bottom">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" colspan="2" style="width:{13.2*$k}mm;border-right:solid 0.8pt black;">
								<span class="graphNo">3</span>
								<span class="graph">Формы</span>
							</td>
							<td class="graph" rowspan="2" style="width:{13.2*$k}mm;border-left:solid 0.8pt black;">
								<!--span class="graphNo">4</span>
								<span class="graph" style="white-space: nowrap;">Отгр. спец.</span>
								<br/-->
								<!--xsl:apply-templates select="catESAD_cu:SpecificationNumber"/>
								<xsl:if test="catESAD_cu:SpecificationNumber and catESAD_cu:SpecificationListNumber">
									<xsl:text> / </xsl:text>
								</xsl:if>
								<xsl:apply-templates select="catESAD_cu:SpecificationListNumber"/-->
							</td>
						</tr>
						<tr valign="top">
							<td align="center" class="graph" style="width:{6.6*$k}mm;border-right:solid 0.8pt black;">
								<xsl:choose>
									<xsl:when test="$root/casdo:EDocIndicatorCode = 'ЭД'">
										<xsl:apply-templates select="$root/casdo:EDocIndicatorCode"/>
									</xsl:when>
									<xsl:otherwise>1</xsl:otherwise>
								</xsl:choose>
							</td>
							<td align="center" class="graph" style="width:{6.6*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;">
								<xsl:if test="$root/casdo:EDocIndicatorCode != 'ЭД'">
									<xsl:apply-templates select="$root/csdo:PageQuantity"/>
								</xsl:if>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="width:{87*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td align="center" class="graph" style="width:{13.2*$k}mm;border-right:solid 0.8pt black;background:#FFFFFF;">
								<span class="graphNo">5</span>
								<span class="graph">Всего т-ов</span>
								<br/>
								<xsl:apply-templates select="casdo:GoodsQuantity"/>
							</td>
							<td align="center" class="graph" style="width:{18.4*$k}mm;border-left:solid 0.8pt black;border-right:solid 0.8pt black;background:#FFFFFF;">
								<span class="graphNo">6</span>
								<span class="graph">Всего мест</span>
								<br/>
								<xsl:apply-templates select="casdo:CargoQuantity"/>
								<!--xsl:choose>
									<xsl:when test="catESAD_cu:TotalPackageNumber!=''">
										<xsl:apply-templates select="catESAD_cu:TotalPackageNumber"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose-->
							</td>
							<td class="graph" style="width:{45.4*$k}mm;border-left:solid 0.8pt black;">
								<span class="graphNo">7</span>
								<span class="graph">Справочный номер</span>
								<br/>
								<xsl:apply-templates select="//casdo:DeclarationFeatureCode"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr valign="top">
				<td style="width:{86*$k}mm;border:solid 0.8pt black;background:#FFFFFF;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td class="graph" style="width:{86*$k}mm;">
								<span class="graphNo">8</span>
								<span class="graph">Получатель</span>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="width:{86*$k}mm;">
								<xsl:apply-templates select="cacdo:ConsigneeDetails"/>
							</td>
						</tr>
					</table>
				</td>
				<td class="graph" colspan="2" style="width:{87*$k}mm;border:solid 0.8pt black;" valign="top">
					<span class="graphNo">9</span>
					<span class="graph"> Таможенный представитель</span>
					<br/>
					<xsl:apply-templates select="$root" mode="graph9"/>
				</td>
			</tr>
			<tr valign="top">
				<td rowspan="2" style="width:{86*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td class="graph" style="width:{43*$k}mm;">
								<span class="graphNo">14</span>
								<span class="graph">Декларант</span>
							</td>
							<td class="graph" style="width:{43*$k}mm;">
								<!--xsl:if test="ESADout_CU:ESADout_CUDeclarant/RUDECLcat:AEORegistryIdDetails/catESAD_cu:DocId">
									<xsl:text>№ </xsl:text>
									<xsl:apply-templates select="ESADout_CU:ESADout_CUDeclarant/RUDECLcat:AEORegistryIdDetails/catESAD_cu:DocId"/>
								</xsl:if-->
							</td>
						</tr>
						<tr valign="top">
							<td class="graph" colspan="2" style="width:{86*$k}mm;">
								<xsl:apply-templates select="$root/cacdo:DeclarantDetails"/>
								<!--xsl:if test="ESADout_CU:ESADout_CUDeclarant">
									<xsl:apply-templates mode="org" select="ESADout_CU:ESADout_CUDeclarant"/>
								</xsl:if-->
							</td>
						</tr>
					</table>
				</td>
				<td colspan="2" style="vertical-align: bottom;border-right:solid 0.8pt black;" valign="top">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td class="graph" style="width:{43.5*$k}mm;background:#FFFFFF; border-right:0.8pt solid black;">
								<span class="graphNo">15</span>
								<span class="graph">Страна отправления</span>
								<br/>
								<xsl:apply-templates select="casdo:DepartureCountryCode"/>
								<!--xsl:apply-templates select="ESADout_CU:ESADout_CUConsigment/catESAD_cu:DispatchCountryName"/-->
							</td>
							<td style="width:{43.5*$k}mm; vertical-align: bottom;">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="width:{87*$k}mm;border:solid 0.8pt black;" valign="top">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" style="width:{43.5*$k}mm; border-right: solid 0.8pt black; height: 100%;">
								<!--span class="graphNo">16</span>
								<span class="graph">Страна происхождения</span-->
								<!--br/-->
								<br/>
								<!--xsl:if test="catESAD_cu:OriginCountryName">
									<xsl:apply-templates select="catESAD_cu:OriginCountryName"/>
								</xsl:if>
								<xsl:if test="catESAD_cu:OriginCountryCode">
									<xsl:text> (</xsl:text>
									<xsl:apply-templates select="catESAD_cu:OriginCountryCode"/>
									<xsl:text>)</xsl:text>
								</xsl:if-->
							</td>
							<td class="graph" style="width:{43.5*$k}mm;background:#FFFFFF;">
								<span class="graphNo">17</span>
								<span class="graph">Страна назначения</span>
								<br/>
								<xsl:apply-templates select="casdo:DestinationCountryCode"/>
								<!--xsl:apply-templates select="ESADout_CU:ESADout_CUConsigment/catESAD_cu:DestinationCountryName"/-->
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<table cellpadding="0" cellspacing="0" style="border-left:solid 0.8pt black;" width="100%">
						<tr valign="top">
							<td class="graph" style="width:{60.4*$k}mm;background:#FFFFFF;">
								<span class="graphNo">18</span>
								<span class="graph">Идентификация и страна регистрации трансп.средства при отправлении/прибытии</span>
							</td>
							<td align="center" class="graph" style="width:{26*$k}mm;border-left:solid 1pt black;border-bottom:solid 0pt black;border-right:solid 1pt black;background:#FFFFFF;">
								<span class="graphNo">19</span>
								<span class="graph">Контейнер</span>
							</td>
							<td class="graph" colspan="3" style="width:{91.1*$k}mm; border-right: 1pt solid black;">
							</td>
						</tr>
						<tr>
							<td class="graph">
								<table>
									<xsl:choose>
										<xsl:when test="not($root/cacdo:TransportMeansItemDetails)">
											<tr>
												<td style="width:{56.3*$k}mm; border-right: 1pt solid black;"><br/><br/></td>
												<td/>
											</tr>
										</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="$root/cacdo:TransportMeansItemDetails">
												<tr>
													<td class="graph" style="width:{56.3*$k}mm; border-right: 1pt solid black;">
														<xsl:apply-templates select="csdo:ObjectOrdinal"/>
														<xsl:if test="csdo:UnifiedTransportModeCode">
															<xsl:text>:</xsl:text>
															<xsl:apply-templates select="csdo:UnifiedTransportModeCode"/>
														</xsl:if>
														<xsl:if test="casdo:TransportTypeCode">
															<xsl:text>:</xsl:text>
															<xsl:apply-templates select="casdo:TransportTypeCode"/><!-- расшифровка типа из параметра -->
														</xsl:if>
														<xsl:if test="csdo:TransportMeansRegId">
															<xsl:text>:</xsl:text>
															<xsl:apply-templates select="csdo:TransportMeansRegId"/>
														</xsl:if>
														<xsl:if test="csdo:VehicleMakeCode">
															<xsl:text>:</xsl:text>
															<xsl:apply-templates select="csdo:VehicleMakeCode"/>
														</xsl:if>
														<xsl:if test="csdo:VehicleModelName">
															<xsl:text>:</xsl:text>
															<xsl:apply-templates select="csdo:VehicleModelName"/>
														</xsl:if>
														<xsl:if test="csdo:VehicleId">
															<xsl:text>:</xsl:text>
															<xsl:apply-templates select="csdo:VehicleId"/>
														</xsl:if>
														<xsl:if test="csdo:DocId">
															<xsl:text>:</xsl:text>
															<xsl:apply-templates select="csdo:DocId"/>
														</xsl:if>
													</td>
													<td class="graph">
														<xsl:apply-templates select="casdo:RegistrationNationalityCode"/>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:otherwise>
									</xsl:choose>
								
								</table>
										
							</td>
							<td align="center" class="graph" style="width:{10*$k}mm;border-left:solid 1pt black;border-bottom:solid 0pt black;border-right:solid 1pt black;" valign="top">
								<xsl:choose>
									<xsl:when test="$root/casdo:ContainerIndicator = 1 or translate(substring($root/casdo:ContainerIndicator, 1, 1), 'T', 't') = 't'">1</xsl:when>
									<xsl:otherwise>0</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="graph" style="width:{53.3*$k}mm;" valign="bottom">
								<table>
									<tbody>
										<tr>
											<td style="width:{10*$k}mm;border-right:solid 1pt black;">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
											<td>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td class="graph" style="width:{12*$k}mm;border-bottom:solid 0pt black;border-left:solid 1pt black;">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3" style="width:{173*$k}mm;border:solid 0.8pt black;" valign="top">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" style="width:{88*$k}mm;border-right:solid 1pt black;background:#FFFFFF;">
								<span class="graphNo">20</span>
								<span class="graph">Средства идентификации</span>
							</td>
							<td class="graph" colspan="2" style="width:{37.5*$k}mm;border-left:solid 1pt black;border-right:solid 0.8pt black;">
								<span class="graphNo">22</span>
								<span class="graph">Валюта и общая сумма по счету</span>
							</td>
							<td align="center" class="graph" rowspan="2" style="width:{19*$k}mm;border-left:solid 1pt black;border-right:solid 0.8pt black;">
							</td>
							<td class="graph" colspan="3" style="width:{28.5*$k}mm;">
							</td>
						</tr>
						<tr>
							<td class="graph" style="width:{78*$k}mm;background:#FFFFFF;">
								<xsl:for-each select="$root/cacdo:CustomsIdentificationDetails">
									<xsl:if test="position() != 1"><br/></xsl:if>
									<xsl:apply-templates select="casdo:SealQuantity"/>
									<xsl:if test="casdo:SealQuantity and casdo:CustomsIdentificationMeansKindCode">/</xsl:if>
									<xsl:apply-templates select="casdo:CustomsIdentificationMeansKindCode"/>
									<xsl:for-each select="cacdo:CustomsIdentificationMeansIdDetails/casdo:CustomsIdentificationMeansId">
										<xsl:text>/</xsl:text>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</xsl:for-each>
							</td>
							<td align="center" class="graph" style="width:{7.8*$k}mm;border-left:solid 1pt black;border-bottom:solid 1pt black;border-right:solid 1pt black;">
								<xsl:apply-templates select="casdo:TotalAmount/@currencyCode"/>
							</td>
							<td align="center" class="graph" style="width:{29.7*$k}mm;border-right:solid 0.8pt black;">
								<xsl:apply-templates select="casdo:TotalAmount"/>
							</td>
							<td align="center" class="graph" style="width:{10.4*$k}mm;border-right:solid 0.8pt black;">
								<!--xsl:apply-templates select="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:DealNatureCode"/-->
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph" style="width:{10.1*$k}mm;border-right:solid 0.8pt black;">
								<!--xsl:apply-templates select="ESADout_CU:ESADout_CUMainContractTerms/catESAD_cu:DealFeatureCode"/-->
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph" style="width:{9*$k}mm;">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="width:{86*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" colspan="2" style="width:{18.8*$k}mm;background:#FFFFFF;">
								<!--span class="graphNo">25</span>
								<span class="graph">Вид транспорта</span-->
							</td>
							<td class="graph" colspan="2" style="width:{18.8*$k}mm;border-left:solid 1pt black;border-right:solid 0.8pt black;">
								<!--span class="graphNo">26</span>
								<span class="graph">Вид транспорта</span-->
							</td>
							<td class="graph" style="width:{48.4*$k}mm;border-left:solid 0.8pt black;background:#FFFFFF;">
								<!--span class="graphNo">27</span>
								<span class="graph">Место погрузки/разгрузки</span-->
							</td>
						</tr>
						<tr>
							<!-- при транзите менять местами значения в 25 и 26 графах -->
							<td align="center" class="graph" style="width:{6.6*$k}mm;border-bottom:solid 1pt black;border-right:solid 1pt black;background:#FFFFFF;">
								<!--xsl:choose>
									<xsl:when test="..//ESADout_CU:CustomsProcedure = 'ТТ'">
										<xsl:for-each select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/cat_ru:TransportModeCode">
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</xsl:when>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode!=''">
										<xsl:apply-templates select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose-->
							</td>
							<td class="graph" style="width:{12.2*$k}mm;background:#FFFFFF;">
								<!--span class="graph">на границе</span-->
							</td>
							<td align="center" class="graph" style="width:{6.6*$k}mm;border-left:solid 1pt black;border-bottom:solid 1pt black;border-right:solid 1pt black;">
								<!--xsl:choose>
									<xsl:when test="..//ESADout_CU:CustomsProcedure = 'ТТ'">
										<xsl:apply-templates select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUBorderTransport/cat_ru:TransportModeCode"/>
									</xsl:when>
									<xsl:when test="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/cat_ru:TransportModeCode!=''">
										<xsl:for-each select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/cat_ru:TransportModeCode">
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
								</xsl:choose-->
							</td>
							<td class="graph" style="width:{12.2*$k}mm;border-right:solid 0.8pt black;">
								<!--span class="graph">внутри страны</span-->
							</td>
							<td class="graph" style="width:{48.4*$k}mm;border-left:solid 0.8pt black;background:#FFFFFF;">
								<!--xsl:apply-templates select="ESADout_CU:ESADoutConsigment/ESADout_CU:ESADoutLoadingPlace"/-->
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
					</table>
				</td>
				<td class="graph" colspan="2" rowspan="2" style="width:{87*$k}mm;border:solid 0.8pt black;" valign="top">
					<!--span class="graphNo">28</span>
					<span class="graph">Финансовые и банковские сведения</span-->
					<br/>
				</td>
			</tr>
			<tr>
				<td align="center" class="graphNum" style="width:{8*$k}mm;border:solid 1pt black;"></td>
                <td align="center" class="graphNum" style="width:{8*$k}mm;border:solid 1pt black;"></td>
				<td style="width:{86*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr valign="top">
							<td class="graph" style="width:{41.4*$k}mm;border-right:solid 0.8pt black;">
								<br/>
							</td>
							<td class="graph" style="width:{44.6*$k}mm;border-left:solid 0.8pt black;">
								<br/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<xsl:apply-templates select="cacdo:TransitGoodsItemDetails[position() = 1]"/>
		<!--table cellpadding="0" cellspacing="0" style="width:100%;">
			<tr valign="top">
				<td class="graph" style="border-right:solid 1px black; border-top: solid 1px black; border-bottom: solid 1px black; width: 73px;" valign="top">
					<span class="graphNo">47</span>
					<span class="graphColumn">Исчисление платежей</span>
				</td>
				<td class="graph" style="width: 45%;">
				</td>
				<td class="graph tl tr">
					<table cellpadding="1px" cellspacing="0" style="width: 100%">
						<tr>
							<td class="tb tr" style="width: 50%; vertical-align: top; min-height: 15pt;">
								<span class="graphNo">48</span>
								<span class="graph">Отсрочка платежей</span>
							</td>
							<td class="tb" style="vertical-align: top;">
								<span class="graphNo">49</span>
								<span class="graph">Реквизиты склада</span>
							</td>
						</tr>
					</table>
					<span class="graphNo">B</span>
					<span class="graph">ПОДРОБНОСТИ ПОДСЧЕТА</span>
					<table cellpadding="1px" cellspacing="0" style="width:100%;">
						<tr>
							<td class="graph" style="width:{83*$k}mm;" valign="top">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table-->
		<table cellpadding="0" cellspacing="0" style="width:100%;">
			<xsl:if test="../cacdo:TranshipmentDetails">
				<tr valign="top">
					<td class="graph" style="border-right: 1px solid black; border-bottom: solid 1px black; border-top: 1px solid black; width: 73px;" valign="top">
						<span class="graphNo">55</span>
						<span class="graphColumn">Перегрузки</span>
					</td>
					<td class="graph" colspan="5" style="background:#FFFFFF;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr>
								<xsl:for-each select="../cacdo:TranshipmentDetails">
									<td>
										<table cellpadding="0" cellspacing="0" style="width:100%;">
											<tr>
												<td class="graph" colspan="3" style="width:{177*$k}mm;border:solid 0.8pt black;" valign="top">
													<span class="graph">Место и страна: </span>
													<xsl:apply-templates select="casdo:PlaceName"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="casdo:CACountryCode"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="csdo:CustomsOfficeCode"/>
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{177*$k}mm;border:solid 0.8pt black;" valign="top">
													<span class="graph">Идентификация и страна регистрации нового транспортного средства: </span>
													<br/>
													<xsl:value-of select="count(cacdo:TranshipmentTransportMeansDetails)"/>
													<xsl:text>: </xsl:text>
													<xsl:for-each select="cacdo:TranshipmentTransportMeansDetails">
														<xsl:if test="position() != 1"> / </xsl:if>
														<xsl:apply-templates select="*[local-name() = 'TransportMeansRegId']"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="*[local-name() = 'TransportMeansRegId']/@countryCode"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="csdo:UnifiedTransportModeCode"/>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td class="graph" style="width:{20*$k}mm;border:solid 0.8pt black;" valign="top">
													<span class="graph">Контейнер</span>
												</td>
												<td align="center" class="graph" style="width:{10*$k}mm;border:solid 1pt black;" valign="top">
													<xsl:choose>
														<xsl:when test="translate(substring(casdo:GoodsTranshsipmentIndicator, 1, 1), 't', 'T') = 'T'">1</xsl:when>
														<xsl:when test="translate(substring(casdo:GoodsTranshsipmentIndicator, 1, 1), 'f', 'F') = 'F'">0</xsl:when>
														<xsl:otherwise><xsl:apply-templates select="casdo:GoodsTranshsipmentIndicator"/></xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="graph" style="width:{147*$k}mm;border:solid 0.8pt black;" valign="top">
													
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{177*$k}mm;border:solid 0.8pt black;" valign="top">
													<span class="graph">Порядковый номер перевозчика</span>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="casdo:CarrierOrdinal"/>
												</td>
											</tr>
										</table>
									</td>
								</xsl:for-each>
							</tr>
						</table>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td style="width:{17*$k}mm;border:solid 0.8pt black;">
					<span class="graphNo">F. </span>
					<span class="graphColumn">Подтверждение компетентных органов</span>
				</td>
				<td style="width:{88*$k}mm;border:solid 0.8pt black;"></td>
				<td style="width:{89*$k}mm;border:solid 0.8pt black;"></td>
			</tr>
			<tr valign="top">
				<td class="graph" colspan="6" style="width:{190*$k}mm;border:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" style="width:100%;">
						<tr>
							<td class="graph" style="width:{72*$k}mm;background:#FFFFFF; border-bottom:1pt solid black; border-right: solid 0.8pt black;">
								<span class="graphNo">50</span>
								<span class="graph">Перевозчик</span>
								<br/>
								<xsl:apply-templates select="//cacdo:CarrierDetails"/>
							</td>
							<td class="graph" valign="top" style="width:{32*$k}mm;background:#FFFFFF; border-bottom:1pt solid black; border-right: solid 0.8pt black;">
								<span class="graphNo">51</span>
								<span class="graph">Дата, подпись, печать</span>
								<br/>
								<xsl:apply-templates select="//csdo:EventDate" mode="russian_date"/>
							</td>
							<td class="graph" style="width:{86*$k}mm; border-bottom:1pt solid black; border-left:solid 0.8pt black;" valign="top">
								<span class="graphNo">С</span>
								<span class="graph">Таможенный орган отправления</span>
								<br/>
								<!--xsl:if test="//*[@DocumentModeID='1006078E']/goom:GTDOutResolution">
									<xsl:for-each select="//*[@DocumentModeID='1006078E']/goom:GTDOutResolution">
										<xsl:for-each select="*[local-name()='DecisionCode' or local-name()='ResolutionDescription' or local-name()='DateInf']">
											<xsl:choose>
												<xsl:when test="local-name()='DateInf'">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="."/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="."/>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
											<xsl:if test="position()=last()"><br/></xsl:if>
										</xsl:for-each>
										<xsl:value-of select="catESAD_ru:LNP"/>
									</xsl:for-each>
								</xsl:if-->
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="border-left: solid 0.8pt black; border-right:1pt solid black;" valign="top">
								<span class="graphNo">52</span>
								<span class="graphColumn">Обеспечение</span>
								<br/>
								<xsl:apply-templates select="//cacdo:TransitGuaranteeDetails"/>
							</td>
							<td class="graph" style="background:#FFFFFF;" valign="top">
								<span class="graphNo">53</span>
								<span class="graph">Таможенный орган назначения/пункт назначения</span>
								<br/>
								<xsl:apply-templates select="cacdo:TransitDestinationDetails"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr valign="top">
				<td valign="top" class="graph" colspan="6" style="width:{190*$k}mm;border-top:solid 0.8pt black;">
					<table cellpadding="0" cellspacing="0" style="width:100%;">
						<tr>
							<!--xsl:choose>
								<xsl:when test="//*[@DocumentModeID='1006078E']/goom:GTDOutCommonMark/catESAD_ru:GRNumber='D'">
									<td valign="top" class="graph" style="width:{103*$k}mm;" colspan="2">
										<span class="graphNo">D</span>
										<xsl:for-each select="//*[@DocumentModeID='1006078E']/goom:GTDOutCommonMark[catESAD_ru:GRNumber='D']">
											<br/>
											<xsl:apply-templates select="catESAD_ru:StageMarkIdentifier"/>
											<xsl:text>.</xsl:text>
											<xsl:apply-templates select="catESAD_ru:NoteMarkIdentifier"/>
											<xsl:if test="catESAD_ru:MarkDescription">
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="catESAD_ru:MarkDescription"/>
											</xsl:if>
											<xsl:if test="catESAD_ru:Deadline">
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="catESAD_ru:Deadline" mode="date"/>
											</xsl:if>
											<xsl:if test="catESAD_ru:DocumentInfo/cat_ru:PrDocumentNumber">
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="catESAD_ru:DocumentInfo/cat_ru:PrDocumentNumber"/>
											</xsl:if>
											<xsl:if test="catESAD_ru:DocumentInfo/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="catESAD_ru:DocumentInfo/cat_ru:PrDocumentDate" mode="date"/>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="catESAD_ru:PersonName"/>
										</xsl:for-each>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td valign="top" class="graph" style="width:{43*$k}mm;">
										<span class="graphNo">D</span>
									</td>
									<td class="graph" style="width:{60*$k}mm;"/>
								</xsl:otherwise>
							</xsl:choose-->
							<td valign="top" class="graph" style="width:{95*$k}mm;border-right:solid 0.8pt black;">
								<span class="graphNo">D.</span>
								<span class="graph"> Отметки таможенного органа отправления</span>
							</td>
							<td class="graph" rowspan="6" style="width:{95*$k}mm;border-left:solid 0.8pt black;">
								<span class="graphNo">I. </span>
								<span class="graph">Контроль таможенного органа назначения</span>
								<br/>
								<!--xsl:for-each select="//ESADout_CU:CUESADCustomsRepresentative">
									<span class="graph">1) </span>
										Свид. о включении в Реестр таможенных представителей № <xsl:apply-templates select="RUDECLcat:BrokerRegistryDocDetails/RUDECLcat:RegisterDocumentDetails/RUScat_ru:RegistrationNumberId"/>;<br/>
									<xsl:for-each select="RUDECLcat:RepresentativeContractDetails">
											Договор таможенного представителя с декларантом № 
											 <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:if test="cat_ru:PrDocumentDate">
											от 
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="date"/>
										</xsl:if>; <br/>
									</xsl:for-each>
									<br/>
								</xsl:for-each-->
								<br/>
								<!--span class="graph">Подпись и фамилия декларанта/представителя</span-->
								<br/>
								<!--xsl:for-each select="//ESADout_CU:FilledPerson">
									<span class="graph">2)</span>
									<xsl:apply-templates select="RUDECLcat:SigningDetails/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="RUDECLcat:SigningDetails/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="RUDECLcat:SigningDetails/cat_ru:PersonMiddleName"/>
									<xsl:text> </xsl:text>
									<br/>
									<xsl:for-each select="RUDECLcat:SignatoryPersonIdentityDetails">
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
										<xsl:if test="not(RUScat_ru:IdentityCardName)">
											<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
										</xsl:if>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="date"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
										<br/>
									</xsl:for-each>
									<xsl:if test="RUDECLcat:SigningDetails/cat_ru:PersonPost">
										<xsl:apply-templates select="RUDECLcat:SigningDetails/cat_ru:PersonPost"/>
										<br/>
									</xsl:if>
									<xsl:for-each select="RUDECLcat:SigningDetails/RUScat_ru:CommunicationDetails">
											Телефон <xsl:for-each select="cat_ru:Phone">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
										<br/>
									</xsl:for-each>
									<xsl:for-each select="RUDECLcat:PowerOfAttorneyDetails">
										<span class="graph">3)</span>
										<xsl:if test="cat_ru:PrDocumentName">
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>, 
											</xsl:if>
										<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>, 
											<xsl:if test="cat_ru:PrDocumentDate">
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="date"/>
										</xsl:if>
										<xsl:if test="RUScat_ru:DocValidityDate">
											<span class="graph">до </span>
											<xsl:apply-templates select="RUScat_ru:DocValidityDate" mode="date"/>
											</xsl:if>
										<br/>
									</xsl:for-each>
								</xsl:for-each-->
								<!--Графа 4)-->
								<!--xsl:if test="//ESADout_CU:RegNumberDoc">
									<span class="graph">4)  Исходящий номер регистрации документов</span>
									<br/>
								</xsl:if>
								<xsl:apply-templates select="//ESADout_CU:RegNumberDoc"/>
								<xsl:text> </xsl:text>
								<br/>
								<xsl:if test="//ESADout_CU:SecurityLabelCode"> Код защитной наклейки
										<xsl:apply-templates select="//ESADout_CU:SecurityLabelCode"/>
								</xsl:if>
								<p align="right">
									<xsl:choose>
										<xsl:when test="(//ESADout_CU:CustomsProcedure ='TT') or (//ESADout_CU:CustomsProcedure ='ТТ')">
											<xsl:text> </xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:choose>
												<xsl:when test="//ESADout_CU:FilledPerson/RUDECLcat:SigningDetails/RUScat_ru:SigningDate">
													<xsl:apply-templates select="//ESADout_CU:FilledPerson/RUDECLcat:SigningDetails/RUScat_ru:SigningDate" mode="date"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:apply-templates select="//ESADout_CU:EECEDocHeaderAddInfo/RUScat_ru:EDocDateTime" mode="date"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</p>
								<br/-->
								<!--/xsl:for-each-->
							</td>
						</tr>
						<!--xsl:if test="not(//*[@DocumentModeID='1006078E']/goom:GTDOutCommonMark/catESAD_ru:GRNumber='D')">
							<tr>
								<td class="graph" colspan="3" style="width:{123*$k}mm; border-right:solid 0.8pt black;">
									<span class="graph">Результат:</span>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="3" style="width:{43*$k}mm; border-right:solid 0.8pt black;">
									<span class="graph">Наложенные пломбы:</span>
								</td>
								<td/>
							</tr>
							<tr>
								<td class="graph" colspan="3" style="width:{123*$k}mm; border-right:solid 0.8pt black;">
									<span class="graph">Номер:</span>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="3" style="width:{123*$k}mm; border-right:solid 0.8pt black;">
									<span class="graph">Срок доставки (дата):</span>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="3" style="width:{123*$k}mm; border-right:solid 0.8pt black;">
									<span class="graph">Подпись:</span>
								</td>
							</tr>
						</xsl:if-->
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template match="cacdo:TransitGuaranteeDetails">
		<xsl:apply-templates select="casdo:GuaranteePresentCode"/>
		<xsl:if test="casdo:NoGuaranteeCauseCode">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="casdo:NoGuaranteeCauseCode"/>
		</xsl:if>
		<xsl:if test="cacdo:TransitGuaranteeDocDetails">
			<br/>
			<xsl:apply-templates select="cacdo:TransitGuaranteeDocDetails"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cacdo:TransitGuaranteeDocDetails">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="casdo:PaymentGuaranteeMethodCode"/>
		<xsl:if test="csdo:DocKindCode">
			<xsl:text>-</xsl:text>
			<xsl:apply-templates select="csdo:DocKindCode"/>
		</xsl:if>
		<xsl:if test="csdo:DocId">
			<xsl:text>-</xsl:text>
			<xsl:apply-templates select="csdo:DocId"/>
		</xsl:if>
		<xsl:if test="csdo:DocCreationDate">
			<xsl:text>-</xsl:text>
			<xsl:apply-templates select="csdo:DocCreationDate" mode="russian_date2"/>
		</xsl:if>
		<xsl:if test="cacdo:GuaranteeCertificateIdDetails">
			<xsl:text>-</xsl:text>
			<xsl:apply-templates select="cacdo:GuaranteeCertificateIdDetails" mode="reg_num"/>
		</xsl:if>
		<xsl:if test="cacdo:GuaranteeCustomsDocIdDetails">
			<xsl:text>-</xsl:text>
			<xsl:apply-templates select="cacdo:GuaranteeCustomsDocIdDetails" mode="reg_num"/>
		</xsl:if>
		
		<xsl:if test="casdo:GuaranteeAmount">
			<xsl:text>-</xsl:text>
			<xsl:apply-templates select="casdo:GuaranteeAmount" mode="format_number_2"/>
		</xsl:if>
		<xsl:if test="casdo:GuaranteeAmount/@currencyCode">
			<xsl:text>-</xsl:text>
			<xsl:apply-templates select="casdo:GuaranteeAmount/@currencyCode"/>
		</xsl:if>
		<xsl:if test="casdo:ReferenceConsignmentItemOrdinal or cacdo:ReferenceConsignmentItemRangeDetails">-</xsl:if>
		<xsl:for-each select="casdo:ReferenceConsignmentItemOrdinal">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:for-each select="cacdo:ReferenceConsignmentItemRangeDetails">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:for-each select="*">
				<xsl:if test="position() != 1">-</xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:for-each>
		
	</xsl:template>
	
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[1]"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[2]" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[3]"/>
		<xsl:if test="*[4]">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="*[4]"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cacdo:TransitDestinationDetails">
		<xsl:apply-templates select="ccdo:CustomsOfficeDetails"/>
		<xsl:if test="casdo:CustomsControlZoneId">
			<br/>
			<xsl:apply-templates select="casdo:CustomsControlZoneId"/>
		</xsl:if>
		<xsl:if test="cacdo:RegisterDocumentIdDetails">
			<br/>
			<xsl:apply-templates select="cacdo:RegisterDocumentIdDetails"/>
		</xsl:if>
		<xsl:if test="casdo:RailwayStationCode">
			<br/>
			<xsl:apply-templates select="casdo:RailwayStationCode"/>
		</xsl:if>
		<xsl:if test="ccdo:SubjectAddressDetails">
			<br/>
			<xsl:apply-templates select="ccdo:SubjectAddressDetails"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cacdo:RegisterDocumentIdDetails">
		<xsl:apply-templates select="csdo:DocKindCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="casdo:RegistrationNumberId"/>
	</xsl:template>
	
	<xsl:template match="ccdo:CustomsOfficeDetails">
		<xsl:apply-templates select="csdo:CustomsOfficeCode"/>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="csdo:CustomsOfficeName"/>
	</xsl:template>
	
	<xsl:template match="*" mode="graph9">
		<xsl:apply-templates select="cacdo:SignatoryRepresentativeDetails/cacdo:RegisterDocumentIdDetails/casdo:RegistrationNumberId"/>
		<xsl:if test="cacdo:SignatoryRepresentativeDetails/cacdo:RepresentativeContractDetails">
			<br/>
			<xsl:apply-templates select="cacdo:SignatoryRepresentativeDetails/cacdo:RepresentativeContractDetails" mode="doc"/>
		</xsl:if>
		<xsl:if test="cacdo:SignatoryPersonV2Details/casdo:QualificationCertificateId">
			<br/>
			<xsl:apply-templates select="cacdo:SignatoryPersonV2Details/casdo:QualificationCertificateId"/>
		</xsl:if>
		<xsl:if test="cacdo:SignatoryPersonV2Details/cacdo:PowerOfAttorneyDetails">
			<br/>
			<xsl:apply-templates select="cacdo:SignatoryPersonV2Details/cacdo:PowerOfAttorneyDetails" mode="doc"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="doc">
		<xsl:apply-templates select="csdo:DocKindCode"/>
		<xsl:if test="cacdo:DocumentPresentingDetails/casdo:DocPresentKindCode">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="cacdo:DocumentPresentingDetails/casdo:DocPresentKindCode"/>
		</xsl:if>
		<xsl:if test="csdo:DocKindCode and csdo:DocId">/</xsl:if>
		<xsl:apply-templates select="csdo:DocId"/>
		<xsl:if test="csdo:DocCreationDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="csdo:DocCreationDate" mode="russian_date"/>
		</xsl:if>
		<xsl:if test="csdo:DocValidityDate">
			<xsl:text> истекает </xsl:text>
			<xsl:apply-templates select="csdo:DocValidityDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cacdo:ConsignorDetails|cacdo:ConsigneeDetails|cacdo:DeclarantDetails|cacdo:CarrierDetails">
		<xsl:apply-templates select="csdo:SubjectName"/>
		<xsl:if test="not(csdo:SubjectName) and csdo:SubjectBriefName">
			<xsl:value-of select="csdo:SubjectBriefName"/>
		</xsl:if>
		
		<xsl:if test="ccdo:SubjectAddressDetails">
			<br/>
			<xsl:apply-templates select="ccdo:SubjectAddressDetails"/>
		</xsl:if>
		
		<xsl:if test="csdo:TaxpayerId or csdo:TaxRegistrationReasonCode">
			<br/>
			<xsl:apply-templates select="csdo:TaxpayerId"/>
			<xsl:if test="csdo:TaxpayerId and csdo:TaxRegistrationReasonCode">/</xsl:if>
			<xsl:apply-templates select="csdo:TaxRegistrationReasonCode"/>
		</xsl:if>
		
		<xsl:if test="cacdo:RegisterDocumentIdDetails">
			<br/>
			<xsl:apply-templates select="cacdo:RegisterDocumentIdDetails"/>
		</xsl:if>
		
		<xsl:if test="ccdo:IdentityDocV3Details">
			<br/>
			<xsl:apply-templates select="ccdo:IdentityDocV3Details" mode="identity"/>
		</xsl:if>
		
		<xsl:if test="casdo:CAUniqueCustomsNumberId">
			<br/>
			<xsl:text>№ </xsl:text>
			<xsl:apply-templates select="casdo:CAUniqueCustomsNumberId"/>
		</xsl:if>
		
		<xsl:if test="csdo:UnifiedCountryCode">
			<br/>
			<xsl:apply-templates select="csdo:UnifiedCountryCode"/>
		</xsl:if>
		<xsl:for-each select="cacdo:CarrierRepresentativeDetails/ccdo:FullNameDetails">
			<br/>
			<xsl:for-each select="*">
				<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:for-each>
		
	</xsl:template>
	
	<xsl:template match="*" mode="identity">
		<xsl:apply-templates select="csdo:IdentityDocKindCode"/>
		<xsl:if test="csdo:IdentityDocKindCode">, </xsl:if>
		<xsl:apply-templates select="csdo:UnifiedCountryCode"/>
		<xsl:if test="csdo:DocSeriesId or csdo:DocId">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="csdo:DocSeriesId"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="csdo:DocId"/>
		</xsl:if>
		<xsl:if test="csdo:DocCreationDate">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="csdo:DocCreationDate" mode="russian_date2"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="ccdo:SubjectAddressDetails">
		<xsl:if test="position() != 1">; </xsl:if>
		<xsl:choose>
			<xsl:when test="csdo:AddressKindCode=1"> Адрес регистрации: </xsl:when>
			<xsl:when test="csdo:AddressKindCode=2"> Фактический адрес: </xsl:when>
			<xsl:when test="csdo:AddressKindCode=3"> Почтовый адрес: </xsl:when>
		</xsl:choose>
		<xsl:for-each select="*[local-name() != 'AddressKindCode']">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<!--Верхняя часть листа ТД4-->
	<xsl:template name="td4Head">
	<table width="100%" style="border-collapse: collapse;" cellpadding="0" cellspacing="0">
			<tr>
				<td style="width:77%;">
					<table style="width: 100%; vertical-align: top; border-collapse: collapse; font-size: 7pt;" cellpadding="0" cellspacing="0">
						<tr>
							<td style="width: 71px;"/>
							<td class="header nowrap graphMain" colspan="2">ДОБАВОЧНЫЙ ЛИСТ ТРАНЗИТНОЙ ДЕКЛАРАЦИИ</td>
						</tr>
						<tr>
							<td/>
							<td class="tb">
								<table class="inline">
									<tr>
										<td class="header graphMain"/>
										<td class="number blankNumber" title="Номер бланка"/>
									</tr>
								</table>
							</td>
							<td class="bl bt br" colspan="4">
								<b>1</b> ДЕКЛАРАЦИЯ</td>
							<td colspan="6"/>
						</tr>
						<tr>
							<td/>
							<td class="tl green">
								<table width="100%" class="inline">
									<tr>
										<td class="nowrap" style="width: 50%; border-right: 0.8pt solid black;">
											<span class="graphNo">2</span>
											<span class="graphColumn">Отправитель</span>
										</td>
										<td class="nowrap" style="width: 50%;">
											<span class="graphNo">8</span>
											<span class="graphColumn">Получатель</span>
										</td>
									</tr>
								</table>
							</td>
							<td class="bl br" colspan="4"/>
							<td colspan="3"/>
						</tr>
						<tr>
							<td/>
							<td class="tl green br" rowspan="3" style="border-bottom:solid 0.8pt black;">
							</td>
							<td class="bl bb br containTable" colspan="4" style="vertical-align: bottom;">
								<table class="inline">
									<tr>
										<td align="center" class="graph" rowspan="2" style="width:{8.8*$k}mm;border-right:solid 0.8pt black;background:#FFFFFF;">
											<!--xsl:apply-templates select="//ESADout_CU:CustomsProcedure"/-->
										</td>
										<td align="center" class="graph" rowspan="2" style="width:{4.4*$k}mm;">
											<!--xsl:choose>
												<xsl:when test="(..//ESADout_CU:CustomsProcedure = 'ТТ') or (..//ESADout_CU:CustomsProcedure = 'TT')">
													<xsl:apply-templates select="//ESADout_CU:TransitFeature"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:apply-templates select="//ESADout_CU:CustomsModeCode"/>
												</xsl:otherwise>
											</xsl:choose-->
										</td>
										<td align="center" class="graph" rowspan="2" style="width:{13.2*$k}mm;border-left:solid 0.8pt black;background:#FFFFFF;">
											<!--xsl:if test="//ESADout_CU:ElectronicDocumentSign">
												<xsl:value-of select="'ЭД '"/>
											</xsl:if-->
											<!--xsl:apply-templates select="//ESADout_CU:ElectronicDocumentSign"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="//ESADout_CU:DocUsageCode"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="//ESADout_CU:TransitDirectionCode"/-->
										</td>
									</tr>
								</table>
							</td>
							<td/>
						</tr>
						<tr>
							<td/>
							<td class="nowrap" colspan="2">
								<b>3</b> Формы
						<!--xsl:apply-templates select="catESAD_cu:AdditionalSheetCount"/-->
								<xsl:text> | </xsl:text>
								<!--xsl:apply-templates select="//catESAD_cu:TotalSheetNumber"/-->
							</td>
							<td class="br tb bl number" rowspan="2">1</td>
							<td class="br tb bl number" rowspan="2">6</td>
							<td/>
						</tr>
						<tr>
							<td class="tb"/>
							<td class="tb"/>
							<td class="tb"/>
							<td class="tb"/>
						</tr>
					</table>
				</td>
				<td class="graph" style="width:23%;">
					А. Таможенный орган отправления
				</td>
			</tr>
	</table>
		</xsl:template>
	<!--Товар-->
	<xsl:template match="cacdo:TransitGoodsItemDetails">
		<div class="goods">
			<xsl:attribute name="id"><xsl:text>generate-id(.)</xsl:text></xsl:attribute>
			<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt black;">
				<tr>
					<td class="graph" rowspan="3" style="width:68px; border-right:solid 0.8pt black;border-top:solid 0.8pt black;" valign="top">
						<span class="graphNo">31</span>
						<span class="graphColumn">Грузовые места<br/>и описание<br/>товаров</span>
					</td>
					<td class="graph" style="width:{98.8*$k}mm;border-top:solid 0.8pt black;background:#FFFFFF;" valign="top">
						<!--span class="graph">Маркировка и количество - Номера контейнеров - Количество и отличительные особенности</span-->
					</td>
					<td class="graph" style="width:{11*$k}mm; border-top:solid 0.8pt black; background:#FFFFFF;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr>
								<td class="graph" style="width:{11*$k}mm; border-left:solid 1pt black;">
									<span class="graphNo">32</span>
									<span class="graph">Товар</span>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graph" style="border-left:solid 1pt black;border-bottom:solid 1pt black;border-right:solid 1pt black;">
									<xsl:choose>
										<xsl:when test="casdo:ConsignmentItemOrdinal">
											<xsl:apply-templates select="casdo:ConsignmentItemOrdinal"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</td>
					<td align="left" class="graph" style="width:{20.6*$k}mm;border-top:solid 0.8pt black;border-left:solid 0.8pt black;border-bottom:solid 0.8pt black;background:#FFFFFF;">
						<span class="graphNo">33</span>
						<span class="graph">Код товара</span>
						<br/>
						<xsl:apply-templates select="csdo:CommodityCode"/>
						<xsl:apply-templates select="casdo:GoodsProhibitionFreeCode"/>
						<xsl:apply-templates select="casdo:GoodsComponentCode"/>
					</td>
					<td class="graph" colspan="2" style="border:solid 0.8pt black; vertical-align: bottom;">
						<table cellpadding="0" cellspacing="0" style="width:100%; vertical-align:bottom;">
							<tr class="graph" align="center">
								<td colspan="2" style="width:{23.8*$k}mm; border-right:solid 0.8pt black;">
									<br/>
								</td>
								<td style="width:{7*$k}mm; border-right:solid 0.8pt black; ">
									<br/>
								</td>
								<td style="width:{15.8*$k}mm; border-right:solid 0.8pt black;">
									<br/>
								</td>
							</tr>
							<tr class="graph" align="center">
								<td style="width:{7*$k}mm; border-right:solid 0.8pt black;">
								</td>
								<td style="width:{17.8*$k}mm; border-right:solid 0.8pt black;">
								</td>
								<td style="width:{7*$k}mm; border-right:solid 0.8pt black; ">
								</td>
								<td style="width:{15.8*$k}mm; border-right:solid 0.8pt black;">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="graph" colspan="2" rowspan="2" style="width:{122.8*$k}mm; border-bottom:solid 0.8pt black; background:#FFFFFF;word-break: break-all;" valign="top">
						<xsl:text>1) </xsl:text>
						<xsl:apply-templates select="casdo:GoodsDescriptionText"/>
						<br/>
						<xsl:text>2) </xsl:text>
						<xsl:apply-templates select="cacdo:CargoPackagePalletDetails/casdo:CargoQuantity"/>
						<xsl:for-each select="cacdo:CargoPackagePalletDetails/cacdo:PackagePalletDetails">
							<xsl:text>, </xsl:text>
							<xsl:apply-templates select="csdo:PackageKindCode"/>
							<xsl:text>-</xsl:text>
							<xsl:apply-templates select="csdo:PackageQuantity"/>
							<xsl:if test="casdo:CargoDescriptionText">
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="casdo:CargoDescriptionText"/>
							</xsl:if>
						</xsl:for-each>
						<br/>
						<xsl:text>3) </xsl:text>
						<xsl:for-each select="cacdo:ContainerListDetails/cacdo:ContainerDetails">
							<xsl:if test="position() != 1"> / </xsl:if>
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</td>
					<td colspan="3" style="width:{67.2*$k}mm; vertical-align: top; border-right:solid 0.8pt black;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr class="graph" align="left" style="vertical-align: top">
								<td width="3%"/>
								<td width="14%"/>
								<td width="3%"/>
								<td width="11%"/>
								<td width="46%"/>
								<td width="23%"/>
							</tr>
							<tr class="graph" align="left" style="vertical-align: top">
								<td colspan="4" style="border-left:solid 1pt black; border-right:solid 1pt black;">
								</td>
								<td style="border-right:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">35</span>
									<span class="graph">Масса брутто (кг)</span>
								</td>
								<td style="border-right:solid 0.8pt black;word-break: break-all;">
								</td>
							</tr>
							<tr class="graph" align="center" style="vertical-align: bottom">
								<td style="border-left:solid 1pt black;border-right:solid 0.8pt black;border-bottom:solid 1pt black;word-break: break-all;"><!--a--></td>
								<td style="border-right:solid 0.8pt black; border-bottom:solid 1pt black;word-break: break-all;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td style="border-right:solid 0.8pt black; border-bottom:solid 1pt black;word-break: break-all;"><!--b--></td>
								<td style="border-right:solid 1pt black; border-bottom:solid 1pt black;word-break: break-all;">
									<!--xsl:apply-templates select="catESAD_cu:PrefOriginCountry/catESAD_cu:CountryCode"/-->
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="left" style="border-right:solid 0.8pt black; border-bottom:solid 0.8pt black;word-break: break-all;">
									<xsl:choose>
										<xsl:when test="csdo:UnifiedGrossMassMeasure &lt; 0.001">
											<xsl:apply-templates select="csdo:UnifiedGrossMassMeasure" mode="format_number_6"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="csdo:UnifiedGrossMassMeasure" mode="format_number_3"/>
										</xsl:otherwise>
									</xsl:choose>
									
								</td>
								<td align="left" style="border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;word-break: break-all;">
								</td>
							</tr>
							<tr class="graph" align="left" style="vertical-align: top">
								<td colspan="4" style="border-left:solid 1pt black;border-right:solid 1pt black;word-break: break-all;">
									<br/>
								</td>
								<!--td style="width:{30.8*$k}mm; border-right:solid 0.8pt black;"-->
								<td style="border-right:solid 0.8pt black;word-break: break-all;">
								</td>
								<!--td style="width:{15.8*$k}mm; border-right:solid 0.8pt black;"-->
								<td style="border-right:solid 0.8pt black;word-break: break-all;">
								</td>
							</tr>
							<tr class="graph" align="left" style="vertical-align: bottom">
								<td colspan="2" align="center" style="border-left:solid 1pt black; border-right:solid 0.8pt black; border-bottom:solid 1pt black;word-break: break-all;">
								</td>
								<td colspan="2" align="center" style="border-right:solid 1pt black;border-bottom:solid 1pt black;word-break: break-all;">
								</td>
								<td style="border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;word-break: break-all;">
								</td>
								<td style="border-right:solid 0.8pt black; border-bottom:solid 0.8pt black;word-break: break-all;">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr class="graph" style="vertical-align: bottom;">
					<td colspan="3" style="width:{67.2*$k}mm; border-right:solid 0.8pt black; border-bottom:solid 0.8pt black; background:#FFFFFF;word-break: break-all;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tr class="graph" align="left" style="vertical-align: top">
								<td colspan="2" style="width:{67.2*$k}mm; border-left:solid 0.8pt black; border-top:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">40</span>
									<span class="graph">Предшествующий документ</span>
								</td>
							</tr>
							<tr class="graph" align="left" style="vertical-align: bottom">
								<td colspan="2" style="width:{67.2*$k}mm; border-left:solid 0.8pt black;word-break: break-all;">
									<xsl:if test="not(cacdo:TDPrecedingDocDetails)">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:if>
									<xsl:for-each select="cacdo:TDPrecedingDocDetails">
										<xsl:if test="position() != 1"><br/></xsl:if>
										<xsl:apply-templates select="csdo:DocKindCode"/>
										<xsl:for-each select="cacdo:CustomsDocIdDetails">
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="csdo:CustomsOfficeCode"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="csdo:DocCreationDate" mode="russian_date_gtd"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="casdo:CustomsDocumentId"/>
											<xsl:if test="casdo:CustomsDocumentOrdinalId">
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="casdo:CustomsDocumentOrdinalId"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="cacdo:TIRIdDetails">
											<xsl:text>/</xsl:text>
											<xsl:for-each select="*">
												<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="csdo:DocId">
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
										<xsl:if test="casdo:CustomsProcedureCode">
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="casdo:CustomsProcedureCode"/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:{32*$k}mm; vertical-align: top; border-left: 0.8pt solid black; border-top: 0.8pt solid black; border-right:solid 0.8pt black;word-break: break-all;">
									<span class="graphNo">41</span>
									<span class="graph">Доп.единицы измерения</span>								</td>
								<td class="graph" style="width:{35*$k}mm; vertical-align: top; border-top:solid 0.8pt black; word-break: break-all;">
									<span class="graphNo">42</span>
									<span class="graph">Валюта и стоимость товара</span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr valign="top">
					<td class="graph" style="width:{13*$k}mm;border-right:solid 0.8pt black;border-top:solid 0.4pt black;border-bottom:solid 0.8pt black;word-break: break-all;" valign="top">
						<span class="graphNo">44</span>
						<span class="graphColumn">Дополнит. информация/ Представл. документы/ Сертификаты и разрешения</span>
					</td>
					<td class="graph" colspan="2" style="width:{122*$k}mm;border-bottom:solid 0.8pt black; background:#FFFFFF;word-break: break-all;">
						
						<xsl:for-each select="cacdo:TDPresentedDocDetails">
							<xsl:if test="position()!=1"><br/></xsl:if>
							<xsl:apply-templates select="." mode="doc"/>
							<!--xsl:text>/</xsl:text>
							<xsl:apply-templates select="cacdo:DocumentPresentingDetails"/-->
						</xsl:for-each>
						
					
					</td>
					<td class="graph" colspan="3" style="width:{68*$k}mm;border-bottom:solid 0.8pt black; border-right:solid 0.8pt black;word-break: break-all;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tbody>
								<tr>
									<td style="width:33mm; border-left: 1pt solid black; border-bottom: 1pt solid black; border-right: 1pt solid black;">
										<table cellpadding="0" cellspacing="0" style="width:100%;">
											<tbody>
												<tr>
													<td class="graph" style="width:24mm; border-right: 1pt solid black;">
														<xsl:choose>
															<xsl:when test="not(cacdo:GoodsMeasureDetails/casdo:GoodsMeasure)"><br/></xsl:when>
															<xsl:when test="cacdo:GoodsMeasureDetails/casdo:GoodsMeasure &lt; 0.01">
																<xsl:apply-templates select="cacdo:GoodsMeasureDetails/casdo:GoodsMeasure" mode="format_number_6"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:apply-templates select="cacdo:GoodsMeasureDetails/casdo:GoodsMeasure" mode="format_number_2"/>
															</xsl:otherwise>
														</xsl:choose>
													</td>
													<td class="graph" style="width:7mm;">
														<xsl:apply-templates select="cacdo:GoodsMeasureDetails/casdo:GoodsMeasure/@measurementUnitCode"/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td style="width:34mm; border-bottom: 1pt solid black;">
										<table cellpadding="0" cellspacing="0" style="width:100%;">
											<tbody>
												<tr>
													<td class="graph" style="width:10mm; border-right:1pt solid black;">
														<xsl:choose>
															<xsl:when test="casdo:CAValueAmount/@currencyCode">
																<xsl:apply-templates select="casdo:CAValueAmount/@currencyCode"/>
															</xsl:when>
															<xsl:otherwise>
																<br/>
															</xsl:otherwise>
														</xsl:choose>
													</td>
													<td class="graph" style="width:24mm;">
														<xsl:apply-templates select="casdo:CAValueAmount"/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td style="border-right: 1pt solid black;"></td>
									<td>
										<table cellpadding="0" cellspacing="0" style="width:100%;">
											<tbody>
												<tr>
													<td style="width:10mm; border-bottom:1pt solid black; border-right:1pt solid black;"><br/><br/></td>
													<td style="width:25mm;"><br/></td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td style="border-right: 1pt solid black;"><br/></td>
									<td><br/></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	
	<xsl:template match="cacdo:DocumentPresentingDetails">
		<xsl:apply-templates select="casdo:DocPresentKindCode"/>
		<xsl:if test="csdo:DocKindCode">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="csdo:DocKindCode"/>
		</xsl:if>
		<xsl:for-each select="cacdo:CustomsDocIdDetails">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="csdo:CustomsOfficeCode"/>
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="csdo:DocCreationDate" mode="russian_date_gtd"/>
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="casdo:CustomsDocumentId"/>
			<xsl:if test="casdo:CustomsDocumentOrdinalId">
				<xsl:text>/</xsl:text>
				<xsl:apply-templates select="casdo:CustomsDocumentOrdinalId"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="DTMDocDetails">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="csdo:CustomsOfficeCode"/>
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="csdo:DocCreationDate" mode="russian_date_gtd"/>
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="casdo:CustomsDocumentId"/>
			<xsl:if test="casdo:CustomsDocumentOrdinalId">
				<xsl:text>/</xsl:text>
				<xsl:apply-templates select="casdo:CustomsDocumentOrdinalId"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="cacdo:TIRIdDetails">
			<xsl:text>/</xsl:text>
			<xsl:for-each select="*">
				<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:for-each>
		<xsl:for-each select="csdo:PrecedingDocId">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
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
	<xsl:template name="russian_date2">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='TransitDeclaration']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date2">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date2">
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
	<xsl:template name="russian_date_gtd">
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
	<xsl:template match="*" mode="format_number_2">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(.,'0.00')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="format_number_3">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(.,'0.000')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="format_number_6">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(.,'0.000000')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
