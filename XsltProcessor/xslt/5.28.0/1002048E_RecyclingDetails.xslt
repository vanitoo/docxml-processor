<?xml version="1.0" encoding="utf-8"?>
<!-- (в ред. Постановлений Правительства РФ от 06.02.2016 № 81, от 06.10.2017 № 1215, от 18.11.2020 № 1866) (Форма расчета УС по ПП 81_С) -->
<!-- (в ред. Постановления Правительства РФ от 31.05.2018 № 639) (Форма расчета УС по ПП 1291_К) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" 
	xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" 
	xmlns:rd="urn:customs.ru:Information:CommercialFinanceDocuments:RecyclingDetails:5.26.0"
	
	xmlns:rdm="urn:customs.ru:Information:CustomsDocuments:RecyclingDetailsMark:5.24.0">
	
	<xsl:param name="RecyclingDetailsMark"/>
	
	<xsl:key name="typeKC_TPO" match="rd:UtilCollDetails" use="rd:TPORegNumber"/>
	<xsl:key name="typeKC_TD" match="rd:UtilCollDetails" use="rd:CustomsDeclarationIdDetails"/>
	<xsl:key name="typeKC_Docs" match="*[local-name() = 'PresentedDocument' or local-name() = 'TransportDocument']" use="concat(cat_ru:PrDocumentNumber, cat_ru:PrDocumentDate, RUScat_ru:DocKindCode)"/>
	<!-- Шаблон для типа RecyclingDetailsType -->
	<xsl:template match="rd:RecyclingDetails">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Индивидуальная накладная при экспресс перевозке</title>
				<style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                    }

                    div.pagePortrait {
                        width: 210mm;
                        margin-top: 10pt;
                        margin-bottom: 10pt;
                        margin-left: auto;
                        margin-right: auto;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                        text-align: left;
                    }

                    div.pageAlbum {
                        width: 297mm;
                        margin-top: 10pt;
                        margin-bottom: 10pt;
                        margin-left: auto;
                        margin-right: auto;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                        text-align: left;
                    }

                    .bold {
                        font-weight: bold;
                    }


                    .bold2 {
                        font-weight: bold;
                    }
                    td {
                        vertical-align: top;
                    }

                    table { border: 0; cellpadding: 3; cellspacing: 0; width:100%; border-collapse: collapse; }
                    
					td { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }					
					td.bold { font-size: 8.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }										
					td.value { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }					
					td.border-left { border-left: medium none; border-right: .5pt solid windowtext; }					
					td.border { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }					
					td.border-left { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: medium none; } 					
					td.border-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; } 					
					td.border-top { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 					
					td.border-bottom { border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; } 					
					td.border-top-bottom { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; } 					
					td.border-top-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 					
					td.border-top-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }					
					td.border-left-right-bottom { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }					
					td.border-left-right-top { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; }					
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }					
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }					
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }					
					td.border-left-top { border-left: .5pt solid windowtext; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 					
					td.border-right-top { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; }                     
					th { font-weight: bold;font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }					

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
					.graphLittle {
					font-family: Arial;
					font-size: 7pt;
					text-align: center;
					}
					.graph8Bold {
					font-family: Arial;
					font-size: 8pt;
					font-weight: bold;
					}				
                    
                    @media print {
                        div.pageAlbum {
                            border: none;
                        }
                    }
                </style>
			</head>
			<body>
				<!-- ************************************************************************************************************************************************************************************************************** -->
				<!-- *** реализация для (Форма расчета УС по ПП 1118) ******************************************************************************************************************************************** -->
				<!-- ************************************************************************************************************************************************************************************************************** -->
				<xsl:if test="rd:UtilCollDetails[rd:Sign = 'К' or rd:Sign = 'K']"> <!-- реализация для (Форма расчета УС по ПП 1291_К) -->
					<div class="pageAlbum">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<font size="4">
											<b>
												<xsl:text>Р А С Ч Е Т</xsl:text>
											</b>
											<br/>
											<b>
												<!--xsl:text>суммы утилизационного сбора в отношении колесных транспортных средств (шасси) и (или) прицепов к ним, уплачиваемого лицами, указанными в абзацах втором и пятом пункта 3 статьи 24.1 Федерального закона "Об отходах производства и потребления"</xsl:text-->
												<xsl:text>суммы утилизационного сбора в отношении колесных транспортных средств (шасси) и (или) прицепов к ним, уплачиваемого лицами, указанными в абзацах втором, четвертом (при уплате утилизационного сбора лицами, которые приобрели колесные транспортные средства на территории Российской Федерации у лиц, не уплачивающих утилизационного сбора в соответствии с абзацами вторым и третьим пункта 6 статьи 24.1 Федерального закона "Об отходах производства и потребления", или у лиц, не уплативших в нарушение установленного порядка утилизационного сбора в отношении ввезенного колесного транспортного средства) и пятом пункта 3 статьи 24.1 Федерального закона "Об отходах производства и потребления"</xsl:text>
											</b>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tr>
								<td class="graphMain" width="2%"/>
								<td class="graphMain" width="1%"/>
								<td class="graphMain" width="42%"/>
								<td class="graphMain" width="32%"/>
								<td class="graphMain" width="1%"/>
								<td class="graphMain" width="3%"/>
								<td class="graphMain" width="1%"/>
								<td class="graphMain" width="1%"/>
								<td class="graphMain" width="9%"/>
								<td class="graphMain" width="1%"/>
								<td class="graphMain" width="3%"/>
								<td class="graphMain" width="5%"/>
								<td class="graphMain" width="2%"/>
								<td class="graphMain" width="3%"/>
							</tr>
							<tr valign="bottom" align="center">
								<td class="graphMain" width="2%">
									<!--xsl:text>В</xsl:text-->
								</td>
								<td colspan="2" class="border-bottom">
									<xsl:apply-templates select="rd:Customs/cat_ru:Code"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="rd:Customs/cat_ru:OfficeName"/>
								</td>
								<td class="graphMain"/>
								<td class="graphMain" align="center">
									<xsl:text>"</xsl:text>
								</td>
								<td class="border-bottom">
									<xsl:value-of select="substring(rd:CalculateDate, 9, 2)"/>
								</td>
								<td class="graphMain" align="center">
									<xsl:text>"</xsl:text>
								</td>
								<td class="graphMain"/>
								<td class="border-bottom">
									<xsl:variable name="month" select="substring(rd:CalculateDate, 6, 2)"/>
									<xsl:choose>
										<xsl:when test="$month = '01'">января</xsl:when>
										<xsl:when test="$month = '02'">февраля</xsl:when>
										<xsl:when test="$month = '03'">марта</xsl:when>
										<xsl:when test="$month = '04'">апреля</xsl:when>
										<xsl:when test="$month = '05'">мая</xsl:when>
										<xsl:when test="$month = '06'">июня</xsl:when>
										<xsl:when test="$month = '07'">июля</xsl:when>
										<xsl:when test="$month = '08'">августа</xsl:when>
										<xsl:when test="$month = '09'">сентября</xsl:when>
										<xsl:when test="$month = '10'">октября</xsl:when>
										<xsl:when test="$month = '11'">ноября</xsl:when>
										<xsl:when test="$month = '12'">декабря</xsl:when>
									</xsl:choose>
								</td>
								<td class="graphMain"/>
								<td class="graphMain" width="3%">
									<xsl:text>20</xsl:text>
								</td>
								<td class="border-bottom">
									<xsl:value-of select="substring(rd:CalculateDate, 3, 2)"/>
								</td>
								<td class="graphMain"/>
								<td class="graphMain">
									<xsl:text>г.</xsl:text>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="graphLittle">
									<xsl:text>(указывается наименование таможенного органа)</xsl:text>
								</td>
								<td colspan="11" class="graphMain"/>
							</tr>
						</table>
						<br/>
						<table border="1" style="table-layout:fixed;word-wrap:break-word;width:297mm;">
							<tr>
								<th width="4%">№ п/п (№ товара ДТ)</th>
								<th width="7%">Иден-<br/>тифи-<br/>кацион-<br/>ный номер (VIN) или номер машины (рамы)</th>
								<th width="7%">Марка</th>
								<th width="7%">Модель</th>
								<th width="7%">Дата выпуска <sup>1</sup>
								</th>
								<th width="7%">Кате-<br/>гория (вид) транспорт-<br/>ного средства<sup>2</sup>
								</th>
								<th width="7%">Рабочий объем и мощность двигателя (двига- телей) и (или) макси- мальная 30-минутная мощность электри-<br/>ческого (электри- ческих) двигателя (двига- телей)<br/>(электри- ческой машины)<br/>(куб.см/кВт)</th>
								<th width="7%">Модель, номер двигателя</th>
								<th width="6%">Тип двигателя</th>
								<th width="6%">Техни-<br/>чески допус-<br/>тимая макси-<br/>мальная масса (тонн)</th>
								<th width="6%">Базовая ставка</th>
								<th width="4%">Коэф-<br/>фици-<br/>ент</th>
								<th width="6%">Сумма утили-<br/>зацион-<br/>ного сбора (пени), уплачен-<br/>ного в отноше-<br/>нии базового колесного транс-<br/>портного средства (шасси) и (или) прицепа к нему (при наличии)</th>
								<th width="6%">Сумма утили-<br/>зацион-<br/>ного сбора (пени), подлежа-<br/>щая уплате<sup>3</sup>
								</th>
								<th width="6%">Сумма утили-<br/>зацион-<br/>ного сбора (пени) к уплате<sup>4</sup>
								</th>
								<th width="7%">Номер бланка паспорта транс-<br/>портного средства (паспорта шасси транс-<br/>портного средства) или уни-<br/>кальный номер электрон-<br/>ного паспорта транс-<br/>портного средства (электрон-<br/>ного паспорта шасси транспорт-<br/>ного средства)</th>
							</tr>
							<tr>
								<td align="center">1</td>
								<td align="center">2</td>
								<td align="center">3</td>
								<td align="center">4</td>
								<td align="center">5</td>
								<td align="center">6</td>
								<td align="center">7</td>
								<td align="center">8</td>
								<td align="center">9</td>
								<td align="center">10</td>
								<td align="center">11</td>
								<td align="center">12</td>
								<td align="center">13</td>
								<td align="center">14</td>
								<td align="center">15</td>
								<td align="center">16</td>
							</tr>
							<xsl:for-each select="rd:UtilCollDetails[rd:Sign = 'К' or rd:Sign = 'K']">
								<tr>
									<td align="center">
										<xsl:apply-templates select="rd:GoodsRecNumber"/>
										<xsl:if test="rd:GoodsDTNumber">
											<xsl:text> (</xsl:text>
											<xsl:apply-templates select="rd:GoodsDTNumber"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</td>
									<td align="center">
										<xsl:apply-templates select="rd:VINID"/>
									</td>
									<td align="center">
										<xsl:apply-templates select="rd:Vehicle/rd:Mark"/>
									</td>
									<td align="center">
										<xsl:apply-templates select="rd:Vehicle/rd:Model"/>
									</td>
									<td align="center">
										<xsl:choose>
											<xsl:when test="rd:Vehicle/rd:VehicleProdDate/rd:ManufactureDate">
												<xsl:apply-templates select="rd:Vehicle/rd:VehicleProdDate/rd:ManufactureDate" mode="russian_date"/>
											</xsl:when>
											<xsl:when test="rd:Vehicle/rd:VehicleProdDate/rd:ManufactureMonth">
												<xsl:apply-templates select="rd:Vehicle/rd:VehicleProdDate/rd:ManufactureMonth"/>
											</xsl:when>
											<xsl:when test="rd:Vehicle/rd:VehicleProdDate/rd:ManufactureYear">
												<xsl:if test="rd:Vehicle/rd:VehicleProdDate/rd:ManufactureMonth">
													<xsl:text>.</xsl:text>
												</xsl:if>
												<xsl:apply-templates select="rd:Vehicle/rd:VehicleProdDate/rd:ManufactureYear"/>
											</xsl:when>
											<xsl:when test="rd:Chassis/rd:ManufactureDate">
												<xsl:apply-templates select="rd:Chassis/rd:ManufactureDate" mode="russian_date"/>
											</xsl:when>
											<xsl:when test="rd:Chassis/rd:ManufactureMonth">
												<xsl:apply-templates select="rd:Chassis/rd:ManufactureMonth"/>
											</xsl:when>
											<xsl:when test="rd:Chassis/rd:ManufactureYear">
												<xsl:if test="rd:Chassis/rd:ManufactureMonth">
													<xsl:text>.</xsl:text>
												</xsl:if>
												<xsl:apply-templates select="rd:Chassis/rd:ManufactureYear"/>
											</xsl:when>
											<xsl:when test="rd:Trailer/rd:ManufactureDate">
												<xsl:apply-templates select="rd:Trailer/rd:ManufactureDate" mode="russian_date"/>
											</xsl:when>
											<xsl:when test="rd:Trailer/rd:ManufactureMonth">
												<xsl:apply-templates select="rd:Trailer/rd:ManufactureMonth"/>
											</xsl:when>
											<xsl:when test="rd:Trailer/rd:ManufactureYear">
												<xsl:if test="rd:Trailer/rd:ManufactureMonth">
													<xsl:text>.</xsl:text>
												</xsl:if>
												<xsl:apply-templates select="rd:Trailer/rd:ManufactureYear"/>
											</xsl:when>
										</xsl:choose>
									</td>
									<td align="center">
										<xsl:choose>
											<xsl:when test="rd:Vehicle/rd:TransportCategoryCode">
												<xsl:value-of select="rd:Vehicle/rd:TransportCategoryCode"/>
											</xsl:when>
											<xsl:when test="rd:Trailer/rd:TransportCategoryCode">
												<xsl:value-of select="rd:Trailer/rd:TransportCategoryCode"/>
												<xsl:if test="rd:TransportKindCode">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="rd:TransportKindCode"/>
												</xsl:if>
											</xsl:when>
										</xsl:choose>
									</td>
									<td align="center">
										<xsl:choose>
											<xsl:when test="rd:Vehicle/rd:EngineVolumeQuanity">
												<xsl:apply-templates select="rd:Vehicle/rd:EngineVolumeQuanity"/>
												<xsl:text> см</xsl:text><sup>3</sup>
											</xsl:when>
										</xsl:choose>
										<xsl:if test="rd:Vehicle/rd:EngineVolumeQuanity"><br/></xsl:if>
										<xsl:choose>
											<xsl:when test="rd:Vehicle/rd:HybridEngineType">
												<xsl:if test="rd:Vehicle/rd:TotalPowerHybridEngine">
													<xsl:apply-templates select="rd:Vehicle/rd:TotalPowerHybridEngine"/>
													<xsl:text> кВт</xsl:text>
												</xsl:if>
											</xsl:when>
											<xsl:otherwise>
												<xsl:for-each select="rd:Vehicle/rd:Engine[rd:EnginePowerKvtQuanity]">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="rd:EnginePowerKvtQuanity"/>
													<xsl:text> кВт</xsl:text>
												</xsl:for-each>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td align="center">
										<xsl:apply-templates select="rd:Vehicle/rd:Engine/rd:EngineModel"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rd:Vehicle/rd:EngineId"/>
									</td>
									<td align="center">
										<xsl:for-each select="rd:Vehicle/rd:Engine[rd:EngineModeCode]">
											<xsl:if test="position()!=1">
												<br/>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="rd:EngineModeCode = 1">бензиновый</xsl:when>
												<xsl:when test="rd:EngineModeCode = 2">дизельный</xsl:when>
												<xsl:when test="rd:EngineModeCode = 3">электрический</xsl:when>
												<xsl:when test="rd:EngineModeCode = 4">гибридный на основе бензинового</xsl:when>
												<xsl:when test="rd:EngineModeCode = 5">гибридный на основе дизельного</xsl:when>
												<xsl:when test="rd:EngineModeCode = 6">конв. для работы на газе</xsl:when>
												<xsl:when test="rd:EngineModeCode = 7">иной</xsl:when>
												<xsl:otherwise>
													<xsl:apply-templates select="rd:EngineModeCode"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
									</td>
									<td align="center">
										<xsl:choose>
											<xsl:when test="rd:Vehicle/rd:TotalWeight">
												<xsl:apply-templates select="rd:Vehicle/rd:TotalWeight"/>
											</xsl:when>
											<xsl:when test="rd:Chassis/rd:TotalWeight">
												<xsl:apply-templates select="rd:Chassis/rd:TotalWeight"/>
											</xsl:when>
											<xsl:when test="rd:Trailer/rd:TotalWeight">
												<xsl:apply-templates select="rd:Trailer/rd:TotalWeight"/>
											</xsl:when>
										</xsl:choose>
									</td>
									<td align="center">
										<xsl:value-of select="rd:DutyTaxFeeRateValue"/>
									</td>
									<td align="center">
										<xsl:apply-templates select="rd:Coefficient"/>
									</td>
									<td align="center">
										<xsl:apply-templates select="rd:PreviousUtilAmount" mode="transl"/>
									</td>
									<td align="right">
										<xsl:apply-templates select="rd:UtilAmount" mode="transl"/>
										<xsl:if test="rd:UtilAmount and rd:PenaltiesAmount"><br/></xsl:if>
										<xsl:apply-templates select="rd:PenaltiesAmount" mode="transl"/>
									</td>
									<td align="right">
										<xsl:choose>
											<xsl:when test="rd:NoPayIndicator = 1">
												0
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="rd:UtilAmountPayable" mode="transl"/>
												<xsl:if test="rd:UtilAmountPayable and rd:PenaltiesAmountPayable"><br/></xsl:if>
												<xsl:apply-templates select="rd:PenaltiesAmountPayable" mode="transl"/>
											</xsl:otherwise>
										</xsl:choose>
										
									</td>
									<td align="center">
										<xsl:apply-templates select="rd:VehicleEPassportId"/>
										<xsl:if test="not(rd:VehicleEPassportId) and rd:VehiclePassportNumber">
											<xsl:apply-templates select="rd:VehiclePassportNumber"/>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td colspan="10" align="right">
									<xsl:text>Общий размер утилизационного сбора, подлежащий уплате: </xsl:text>
								</td>
								<td colspan="6" align="right">
									<!--xsl:value-of select="sum(rd:UtilCollDetails/rd:UtilAmount)"/-->
									<xsl:apply-templates select="rd:TotalUtilAmount" mode="transl"/>
									<xsl:if test="rd:TotalUtilAmount and rd:TotalPenaltiesAmount"><br/></xsl:if>
									<xsl:apply-templates select="rd:TotalPenaltiesAmount" mode="transl"/>
								</td>
								<!--td align="center"></td>
									<td align="center"></td-->
							</tr>
							<tr>
								<td colspan="10" align="right">
									<xsl:text>Общий размер утилизационного сбора к уплате: </xsl:text>
								</td>
								<td colspan="6" align="right">
									<!--xsl:value-of select="sum(rd:UtilCollDetails/rd:UtilAmount)"/-->
									<xsl:apply-templates select="rd:TotalUtilAmountPayable" mode="transl"/>
									<xsl:if test="rd:TotalUtilAmountPayable and rd:TotalPenaltiesAmountPayable"><br/></xsl:if>
									<xsl:apply-templates select="rd:TotalPenaltiesAmountPayable" mode="transl"/>
								</td>
								<!--td align="center"></td-->
							</tr>
						</table>
						<br/>
						<!-- общая часть - разделы 1 и 2 -->
						<!-- возможно, что будет разведена (и перестанет быть общей)-->
						<!--xsl:apply-templates select="." mode="Parts">
								<xsl:with-param name="sign1" select="'K'"/>
								<xsl:with-param name="sign2" select="'К'"/>
							</xsl:apply-templates-->
						<xsl:apply-templates select="." mode="Wheel"/>
						
						
						<xsl:if test="$RecyclingDetailsMark">
							<xsl:apply-templates select="$RecyclingDetailsMark" mode="part3">
								<xsl:with-param name="KorC" select="'K'"/>
							</xsl:apply-templates>
						</xsl:if>
						
						<!-- сноски -->
						<br/>
						<table>
							<tbody>
								<tr>
									<td style="font-size: 7pt;">
										<sup>1</sup> При отсутствии документального подтверждения даты выпуска колесного транспортного средства (шасси) или прицепа к нему, имеющего идентификационный номер (VIN), которой является дата изготовления колесного транспортного средства (шасси) или прицепа к нему, год выпуска определяется по коду изготовления, указанному в идентификационном номере колесного транспортного средства (шасси) или прицепа к нему, при этом 3-летний срок исчисляется начиная с 1 июля года изготовления.
										<br/>
										<sup>2</sup> Категории колесных транспортных средств (шасси) и прицепов к ним указываются в соответствии с перечнем видов и категорий колесных транспортных средств (шасси) и прицепов к ним, в отношении которых уплачивается утилизационный сбор, а также размеров утилизационного сбора, утвержденным постановлением Правительства Российской Федерации от 26 декабря 2013 г. № 1291 "Об утилизационном сборе в отношении колесных транспортных средств (шасси) и прицепов к ним и о внесении изменений в некоторые акты Правительства Российской Федерации".
										<br/>
										<sup>3</sup> В поле указывается рассчитанная сумма утилизационного сбора, которая подлежит уплате при ввозе транспортного средства в Российскую Федерацию без учета положений пункта 6 статьи 241 Федерального закона "Об отходах производства и потребления". При расчете пеней сумма указывается отдельной строкой ниже сведений о колесном транспортном средстве (шасси) и (или) прицепа без заполнения граф 1 - 13 и 16.
										<br/>
										<sup>4</sup> В поле указывается уплачиваемая сумма утилизационного сбора. В случае ввоза транспортного средства, в отношении которого утилизационный сбор был уплачен и вид (категория) которого не изменялись (в том числе не вносились конструктивные изменения), а также в отношении транспортных средств, в отношении которых утилизационный сбор не уплачивается на основании положений пункта 6 статьи 241 Федерального закона "Об отходах производства и потребления", в поле проставляется "0" (ноль).
										<br/>
										<sup>5</sup> Поле заполняется в случае, если плательщиком выступает лицо, не состоящее на учете в налоговых органах Российской Федерации. В поле указываются сведения о лице в соответствии с абзацами 18 - 21 (после таблицы) подпункта 46 пункта 15 Порядка заполнения декларации на товары, утвержденного решением Комиссии Таможенного союза от 20 мая 2010 г. № 257.
										<br/>
										<sup>6</sup> Расчет утилизационного сбора может содержать сведения о транспортных средствах, задекларированных в одной декларации на товары (по одному таможенному приходному ордеру).".
										</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<!-- ************************************************************************************************************************************************************************************************************** -->
				<!-- *** реализация для (Форма расчета УС по ПП 81_С) *********************************************************************************************************************************************** -->
				<!-- ************************************************************************************************************************************************************************************************************** -->
				<xsl:if test="rd:UtilCollDetails[rd:Sign = 'С' or rd:Sign = 'C']"> <!-- реализация для (Форма расчета УС по ПП 81_С) -->
					<div class="pageAlbum">
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b><xsl:text>Р А С Ч Е Т</xsl:text></b><br/>
												<b><xsl:text>суммы утилизационного сбора в отношении самоходных машин и (или) прицепов к ним, уплачиваемого лицами, указанными в абзацах втором и пятом пункта 3 статьи 24.1 Федерального закона "Об отходах производства и потребления"</xsl:text></b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<!--table>
								<tr>
									<td class="graphMain" width="2%"></td>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="42%"/>
									<td class="graphMain" width="32%"/>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="3%"/>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="9%"/>
									<td class="graphMain" width="1%"/>
									<td class="graphMain" width="3%"/>
									<td class="graphMain" width="5%"/>
									<td class="graphMain" width="2%"/>
									<td class="graphMain" width="3%"/>
								</tr>
								<tr valign="bottom" align="center">
									<td class="graphMain">
										<xsl:text>В</xsl:text>
									</td>
									<td colspan="2" class="border-bottom" valign="bottom">
										<xsl:apply-templates select="rd:Customs/cat_ru:Code"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="rd:Customs/cat_ru:OfficeName"/>
									</td>
									<td class="graphMain"/>
									<td class="graphMain" align="center">
										<xsl:text>"</xsl:text>
									</td>
									<td class="border-bottom">
										<xsl:value-of select="substring(rd:CalculateDate, 9, 2)"/>
									</td>
									<td class="graphMain" align="center">
										<xsl:text>"</xsl:text>
									</td>
									<td class="graphMain"/>
									<td class="border-bottom">
										<xsl:variable name="month" select="substring(rd:CalculateDate, 6, 2)"/>
										<xsl:choose>
											<xsl:when test="$month = '01'">января</xsl:when>
											<xsl:when test="$month = '02'">февраля</xsl:when>
											<xsl:when test="$month = '03'">марта</xsl:when>
											<xsl:when test="$month = '04'">апреля</xsl:when>
											<xsl:when test="$month = '05'">мая</xsl:when>
											<xsl:when test="$month = '06'">июня</xsl:when>
											<xsl:when test="$month = '07'">июля</xsl:when>
											<xsl:when test="$month = '08'">августа</xsl:when>
											<xsl:when test="$month = '09'">сентября</xsl:when>
											<xsl:when test="$month = '10'">октября</xsl:when>
											<xsl:when test="$month = '11'">ноября</xsl:when>
											<xsl:when test="$month = '12'">декабря</xsl:when>
										</xsl:choose>
									</td>
									<td class="graphMain"/>
									<td class="graphMain" width="3%">
										<xsl:text>20</xsl:text>
									</td>
									<td class="border-bottom">
										<xsl:value-of select="substring(rd:CalculateDate, 3, 2)"/>
									</td>
									<td class="graphMain"/>
									<td class="graphMain">
										<xsl:text>г.</xsl:text>
									</td>
								</tr>
								<tr>
									<td colspan="3" class="graphLittle">
										<xsl:text>(указывается наименование таможенного органа)</xsl:text>
									</td>
									<td colspan="11" class="graphMain"/>
								</tr>
							</table>
							<br/-->
							<table border="1" style="table-layout:fixed;word-wrap:break-word;width:297mm;">
								<tr>
									<th width="5%">№ п/п (№ товара ДТ)</th><!-- 1 -->
									<td width="5%">Номер и дата транс-<br/>порт-<br/>ного (пере-<br/>возоч-<br/>ного) доку-<br/>мента</td><!-- 2 -->
									<th width="7%">Иден-<br/>тифи-<br/>каци-<br/>онный номер или за-<br/>водской номер</th><!-- 3 -->
									<th width="7%">Марка</th><!-- 4 -->
									<th width="7%">Модель</th><!-- 5 -->
									<th width="7%">Дата изго-<br/>товления <sup>1</sup></th><!-- 6 -->
									<th width="5%">Мощ-<br/>ность сило-<br/>вой уста-<br/>новки</th><!-- 7 -->
									<th width="7%">Модель, номер дви-<br/>гателя</th><!-- 8 -->
									<th width="6%">Тип дви-<br/>гателя</th><!-- 9 -->
									<th width="5%">Рабо-<br/>чий объем дви-<br/>гателя (куб. см.)</th><!-- 10 -->
									<th width="5%">Грузо-<br/>подъем-<br/>ность (тонн)<sup>2</sup></th><!-- 11 -->
									<th width="6%">Базовая ставка</th><!-- 12 -->
									<th width="4%">Коэф-<br/>фици-<br/>ент</th><!-- 13 -->
									<th width="6%">Сумма утили-<br/>зацион-<br/>ного сбора, упла-<br/>ченного в отно-<br/>шении базо-<br/>вой само-<br/>ходной машины и (или) при-<br/>цепа (при наличии)</th><!-- 14 -->
									<th width="6%">Сумма утили-<br/>зацион-<br/>ного сбора (пени), подле-<br/>жащая уплате<sup>3</sup></th><!-- 15 -->
									<th width="6%">Сумма утили-<br/>зацион-<br/>ного сбора (пени) к уплате<sup>4</sup></th><!-- 16 -->
									<th width="6%">Номер бланка паспорта само-<br/>ходной машины и других видов техники (далее - ПСМ) или уни- кальный номер элект-<br/>ронного ПСМ</th><!-- 17 -->
								</tr>
								<tr>
									<td align="center">1</td>
									<td align="center">2</td>
									<td align="center">3</td>
									<td align="center">4</td>
									<td align="center">5</td>
									<td align="center">6</td>
									<td align="center">7</td>
									<td align="center">8</td>
									<td align="center">9</td>
									<td align="center">10</td>
									<td align="center">11</td>
									<td align="center">12</td>
									<td align="center">13</td>
									<td align="center">14</td>
									<td align="center">15</td>
									<td align="center">16</td>
									<td align="center">17</td>
								</tr>
								<xsl:for-each select="rd:UtilCollDetails[rd:Sign = 'С' or rd:Sign = 'C']">
									<tr>
										<td align="center">
											<xsl:apply-templates select="rd:GoodsRecNumber"/>
											<xsl:if test="rd:GoodsDTNumber">
												<xsl:text> (</xsl:text>
												<xsl:apply-templates select="rd:GoodsDTNumber"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</td>
										<td align="center">
											<!--xsl:apply-templates select="rd:CustomsDeclarationIdDetails" mode="GTDID"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="rd:CustomsDeclarationIdDetails/cat_ru:RegistrationDate" mode="russian_date"/-->
											<!--xsl:for-each select="rd:TransportDocument">
												<xsl:if test="position() != 1"><br/><br/></xsl:if>
												<xsl:apply-templates select="." mode="docShort"/>
											</xsl:for-each-->
											<xsl:apply-templates select="rd:TransportDocument[1]" mode="docShort"/>
											<xsl:if test="count(rd:TransportDocument) &gt; 1 and ../rd:DocType = 0">
												<br/><br/>
												<xsl:text>см. гр. 1.9.</xsl:text>
											</xsl:if>
										</td>
										<td align="center"><xsl:value-of select="rd:VINID"/></td>
										<td align="center">
											<xsl:apply-templates select="rd:Vehicle/rd:Mark"/>
										</td>
										<td align="center">
											<xsl:apply-templates select="rd:Vehicle/rd:Model"/>
										</td>
										<td align="center">
											<xsl:choose>
												<xsl:when test="rd:Vehicle/rd:VehicleProdDate/rd:ManufactureDate">
													<xsl:apply-templates select="rd:Vehicle/rd:VehicleProdDate/rd:ManufactureDate" mode="russian_date"/>
												</xsl:when>
												<xsl:when test="rd:Vehicle/rd:VehicleProdDate/ManufactureMonth">
													<xsl:value-of select="rd:Vehicle/rd:VehicleProdDate/ManufactureMonth"/>
												</xsl:when>
												<xsl:when test="rd:Vehicle/rd:VehicleProdDate/ManufactureYear">
													<xsl:if test="rd:Vehicle/rd:VehicleProdDate/ManufactureMonth"><xsl:text>.</xsl:text></xsl:if>
													<xsl:value-of select="rd:Vehicle/rd:VehicleProdDate/ManufactureYear"/>
												</xsl:when>
												<xsl:when test="rd:Chassis/rd:ManufactureDate">
													<xsl:apply-templates select="rd:Chassis/rd:ManufactureDate" mode="russian_date"/>
												</xsl:when>
												<xsl:when test="rd:Chassis/rd:ManufactureMonth">
													<xsl:value-of select="rd:Chassis/ManufactureMonth"/>
												</xsl:when>
												<xsl:when test="rd:Chassis/ManufactureYear">
													<xsl:if test="rd:Chassis/ManufactureMonth"><xsl:text>.</xsl:text></xsl:if>
													<xsl:value-of select="rd:Chassis/ManufactureYear"/>
												</xsl:when>
												<xsl:when test="rd:Trailer/rd:ManufactureDate">
													<xsl:apply-templates select="rd:Trailer/rd:ManufactureDate" mode="russian_date"/>
												</xsl:when>
												<xsl:when test="rd:Trailer/rd:ManufactureMonth">
													<xsl:value-of select="rd:Trailer/ManufactureMonth"/>
												</xsl:when>
												<xsl:when test="rd:Trailer/ManufactureYear">
													<xsl:if test="rd:Trailer/ManufactureMonth"><xsl:text>.</xsl:text></xsl:if>
													<xsl:value-of select="rd:Trailer/ManufactureYear"/>
												</xsl:when>
											</xsl:choose>
										</td>
										<!--td align="center">
											<xsl:choose>
												<xsl:when test="rd:Vehicle/rd:TransportCategoryCode">
													<xsl:value-of select="rd:Vehicle/rd:TransportCategoryCode"/>
												</xsl:when>
												<xsl:when test="rd:Chassis">
													<xsl:value-of select="'Шасси транспортного средства'"/>
												</xsl:when>
												<xsl:when test="rd:Trailer">
													<xsl:value-of select="'Прицеп'"/>
												</xsl:when>
											</xsl:choose>
										</td-->
										<td align="center">
											<xsl:choose>
												<xsl:when test="rd:Vehicle/rd:EnginePowerQuanityType">
													<xsl:value-of select="rd:Vehicle/rd:EnginePowerQuanityType"/>
												</xsl:when>
											</xsl:choose>
										</td>
										<td align="center">
											<xsl:apply-templates select="rd:Vehicle/rd:EngineModel"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="rd:Vehicle/rd:EngineId"/>
										</td>
										<td align="center">
											<xsl:for-each select="rd:Vehicle/rd:Engine[rd:EngineModeCode]">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:choose>
													<xsl:when test="rd:EngineModeCode = 1">бензиновый</xsl:when>
													<xsl:when test="rd:EngineModeCode = 2">дизельный</xsl:when>
													<xsl:when test="rd:EngineModeCode = 3">электрический</xsl:when>
													<xsl:when test="rd:EngineModeCode = 4">гибридный на основе бензинового</xsl:when>
													<xsl:when test="rd:EngineModeCode = 5">гибридный на основе дизельного</xsl:when>
													<xsl:when test="rd:EngineModeCode = 6">конв. для работы на газе</xsl:when>
													<xsl:when test="rd:EngineModeCode = 7">иной</xsl:when>
													<xsl:otherwise>
														<xsl:apply-templates select="rd:EngineModeCode"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
										</td>
										<td align="center">
											<xsl:apply-templates select="rd:Vehicle/rd:EngineVolumeQuanity"/>
										</td>
										<td align="center">
											<xsl:choose>
												<xsl:when test="rd:Vehicle/rd:TotalWeight">
													<xsl:value-of select="rd:Vehicle/rd:TotalWeight"/>
												</xsl:when>
												<xsl:when test="rd:Chassis/rd:TotalWeight">
													<xsl:value-of select="rd:Chassis/rd:TotalWeight"/>
												</xsl:when>
												<xsl:when test="rd:Trailer/rd:TotalWeight">
													<xsl:value-of select="rd:Trailer/rd:TotalWeight"/>
												</xsl:when>
											</xsl:choose>
										</td>
										<td align="center">
											<xsl:value-of select="rd:DutyTaxFeeRateValue"/>
										</td>
										<td align="center">
											<xsl:value-of select="rd:Coefficient"/>
										</td>
										<td align="center">
											<xsl:apply-templates select="rd:PreviousUtilAmount" mode="transl"/>
										</td>
										<td align="right">
											<xsl:apply-templates select="rd:UtilAmount" mode="transl"/>
											<xsl:if test="rd:UtilAmount and rd:PenaltiesAmount"><br/></xsl:if>
											<xsl:apply-templates select="rd:PenaltiesAmount" mode="transl"/>
										</td>
										<td align="right">
											<xsl:choose>
												<xsl:when test="rd:NoPayIndicator = 1">
													0
												</xsl:when>
												<xsl:otherwise>
													<xsl:apply-templates select="rd:UtilAmountPayable" mode="transl"/>
													<xsl:if test="rd:UtilAmountPayable and rd:PenaltiesAmountPayable"><br/></xsl:if>
													<xsl:apply-templates select="rd:PenaltiesAmountPayable" mode="transl"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td align="center">
											<xsl:apply-templates select="rd:VehicleEPassportId"/>
											<xsl:if test="not(rd:VehicleEPassportId) and rd:VehiclePassportNumber">
												<xsl:apply-templates select="rd:VehiclePassportNumber"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td colspan="14" align="right">
										<xsl:text>Общий размер утилизационного сбора, подлежащий уплате: </xsl:text>
									</td>
									<td align="right">
										<xsl:apply-templates select="rd:TotalUtilAmount" mode="transl"/>
										<xsl:if test="rd:TotalUtilAmount and rd:TotalPenaltiesAmount"><br/></xsl:if>
										<xsl:apply-templates select="rd:TotalPenaltiesAmount" mode="transl"/>
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="15" align="right">
										<xsl:text>Общий размер утилизационного сбора к уплате: </xsl:text>
									</td>
									<td align="right">
										<xsl:apply-templates select="rd:TotalUtilAmountPayable" mode="transl"/>
										<xsl:if test="rd:TotalUtilAmountPayable and rd:TotalPenaltiesAmountPayable"><br/></xsl:if>
										<xsl:apply-templates select="rd:TotalPenaltiesAmountPayable" mode="transl"/>
									</td>
									<td></td>
								</tr>
							</table>
							<br/>
							<!-- общая часть - разделы 1 и 2 -->
							<xsl:apply-templates select="." mode="Parts">
								<xsl:with-param name="sign1" select="'C'"/>
								<xsl:with-param name="sign2" select="'С'"/>
							</xsl:apply-templates>
							
							<xsl:if test="$RecyclingDetailsMark">
								<xsl:apply-templates select="$RecyclingDetailsMark" mode="part3">
									<xsl:with-param name="KorC" select="'C'"/>
								</xsl:apply-templates>
							</xsl:if>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="rd:TransportKindCode">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">легковой</xsl:when>
				<xsl:when test=". = 2">грузопассажирский</xsl:when>
				<xsl:when test=". = 3">прицеп (полуприцеп)</xsl:when>
				<xsl:when test=". = 4">шасси</xsl:when>
				<xsl:when test=". = 5">автобус (троллейбус)</xsl:when>
				<xsl:when test=". = 6">автобетоносмеситель</xsl:when>
				<xsl:when test=". = 7">специальное ТС</xsl:when>
				<xsl:when test=". = 8">фургон (рефрижератор)</xsl:when>
				<xsl:when test=". = 9">автосамосвал</xsl:when>
				<xsl:when test=". = 10">седельный тягач</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="rdm:RecyclingDetailsMark" mode="part3">
		<xsl:param name="KorC"/>
	
		<br/>
		<br/>
		<table>
			<xsl:choose>
				<xsl:when test="$KorC = 'K'"><!--лат-->
					<tr align="center">
						<td>III. Дополнительные сведения</td>
					</tr>
				</xsl:when>
				<xsl:when test="$KorC = 'C'">
					<tr align="left">
						<td>3. Дополнительные сведения</td>
					</tr>
				</xsl:when>
			</xsl:choose>
			
			<tr>
				<td>Признак документа: 
					<xsl:choose>
						<xsl:when test="rdm:DocSign = 0">действует</xsl:when>
						<xsl:when test="rdm:DocSign = 1">аннулирован</xsl:when>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<table>
			<tbody>
				<tr>
					<td>Сведения о транспортных средствах</td>
				</tr>
			</tbody>
		</table>
		<table border="1" style="table-layout:fixed;word-wrap:break-word;width:297mm;">
			<tbody>
				<tr align="center" valign="top">
					<td>Номер товара в Расчете</td>
					<td>Номер товара в декларации</td>
					<td>Номер ТС в гр 31 товара ДТ</td>
					<td>Признак освобождения от уплаты</td>
					<td>Код освобождения от уплаты</td>
					<td>Основание для освобождения от уплаты</td>
					<td>Номер ТПО / Документа расчета</td>
					<td>Результат оформления ТПО</td>
					<td>Дата пересечения границы</td>
					<td>Признак ввоза ТС из Республики Беларусь</td>
					<td>Признак седельного тягача экологического класса Евро-6</td>
					<td>Признак приобретения ТС у лица, использовавшего его не для личного пользования</td>
					<td>Признак второго или каждого последующего транспортного средства, ввезенного лицом на территорию РФ</td>
					<td>Служебные отметки</td>
				</tr>
				<xsl:for-each select="rdm:UtilCollDetails">
					<tr>
						<td><xsl:value-of select="rdm:GoodsRecNumber"/></td>
						<td><xsl:value-of select="rdm:GoodsDTNumber"/></td>
						<td><xsl:value-of select="rdm:RecNumber"/></td>
						<td>
							<xsl:choose>
								<xsl:when test="rdm:NoPayIndicator=0">нет оснований для освобождения от уплаты</xsl:when>
								<xsl:when test="rdm:NoPayIndicator=1">освобождается от уплаты</xsl:when>
								<xsl:when test="rdm:NoPayIndicator=2">не уплачивается по характеристикам ТС</xsl:when>
							</xsl:choose>
						</td>
						<td><xsl:value-of select="rdm:CodeReasonFreePayment"/></td>
						<td><xsl:value-of select="rdm:NoPayReasons"/></td>
						<td><xsl:apply-templates select="rdm:TPORegNumber" mode="RegNum"/></td>
						<td><xsl:value-of select="rdm:PayResult"/></td>
						<td><xsl:apply-templates select="rdm:BorderCrossingDate" mode="russian_date"/></td>
						<td>
							<xsl:choose>
								<xsl:when test="rdm:ImportRBSign = 0 or translate(substring(rdm:ImportRBSign, 1, 1), 'f', 'F') = 'F'">нет</xsl:when>
								<xsl:when test="rdm:ImportRBSign = 1 or translate(substring(rdm:ImportRBSign, 1, 1), 't', 'T') = 'T'">да</xsl:when>
							</xsl:choose>
						</td>
						<td>
							<xsl:choose>
								<xsl:when test="rdm:TruckEuro6Sign = 0 or translate(substring(rdm:TruckEuro6Sign, 1, 1), 'f', 'F') = 'F'">нет</xsl:when>
								<xsl:when test="rdm:TruckEuro6Sign = 1 or translate(substring(rdm:TruckEuro6Sign, 1, 1), 't', 'T') = 'T'">да</xsl:when>
							</xsl:choose>
						</td>
						<td>
							<xsl:choose>
								<xsl:when test="rdm:VehicleWasNotPersonalSign = 0 or translate(substring(rdm:VehicleWasNotPersonalSign, 1, 1), 'f', 'F') = 'F'">нет</xsl:when>
								<xsl:when test="rdm:VehicleWasNotPersonalSign = 1 or translate(substring(rdm:VehicleWasNotPersonalSign, 1, 1), 't', 'T') = 'T'">да</xsl:when>
							</xsl:choose>
						</td>
						<td>
							<xsl:choose>
								<xsl:when test="rdm:SecondOrMoreVehicleSign = 0 or translate(substring(rdm:SecondOrMoreVehicleSign, 1, 1), 'f', 'F') = 'F'">нет</xsl:when>
								<xsl:when test="rdm:SecondOrMoreVehicleSign = 1 or translate(substring(rdm:SecondOrMoreVehicleSign, 1, 1), 't', 'T') = 'T'">да</xsl:when>
							</xsl:choose>
						</td>
						<td><xsl:value-of select="rdm:Comment"/></td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	
	<!-- КОЛЕСНЫЕ -->
	<xsl:template match="*" mode="Wheel">
		<xsl:call-template name="WheelPart1">
			<!--xsl:with-param name="person" select="rd:ApproverPerson"/-->
			<xsl:with-param name="person" select="rd:DocType[. = 0]"/>
		</xsl:call-template>
		<xsl:call-template name="WheelPart2">
			<xsl:with-param name="person" select="rd:DocType[. &gt;= 1]"/>
			<!--xsl:with-param name="person" select="rd:CustomsPersonName"/-->
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="WheelPart1">
		<xsl:param name="person"/>
		<xsl:variable name="root" select="$person/.."/>
		<xsl:variable name="payer" select="$root/rd:Payer[1]"/>
		<table>
			<tr align="center">
				<td>I. Заполняется плательщиком или его уполномоченным представителем </td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>1. Наименование (код) таможенного органа, в который подается расчет,</td>
				<td style="width: 57%;" class="border-bottom">
					<xsl:apply-templates select="$root/rd:Customs"/>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>2. Дата подачи расчета:</td>
				<td style="width: 85%;" class="border-bottom">
					<xsl:apply-templates select="$root/rd:CalculateDate" mode="russian_date"/>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>3. Полное наименование плательщика (фамилия, имя, отчество (при наличии) физического лица):</td>
				<td style="width: 42%;" class="border-bottom">
					<xsl:apply-templates select="$payer" mode="PayerName"/>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>4. ИНН/КПП (при наличии):</td>
				<td style="width: 83%;" class="border-bottom">
					<xsl:apply-templates select="$payer" mode="PayerInnKpp"/>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>5. ОГРН, дата регистрации (паспортные данные физического лица):</td>
				<td style="width: 59%;" class="border-bottom">
					<xsl:apply-templates select="$payer" mode="PayerOgrn"/>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>6. Место нахождения (место жительства (адрес) физического лица):</td>
				<td style="width: 59%;" class="border-bottom">
					<xsl:apply-templates select="$payer" mode="PayerAddress"/>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>7. Сведения о лице, не состоящем на учете в налоговых органах Российской Федерации,<sup>5</sup>
				</td>
				<td style="width: 45%;" class="border-bottom">
					<xsl:apply-templates select="$payer" mode="PayerUITN"/>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>8. Дата пересечения государственной границы Российской Федерации:</td>
				<td style="width: 57%;" class="border-bottom">
					<xsl:apply-templates select="$root/rd:UtilCollDetails[1]/rd:BorderCrossingDate" mode="russian_date"/>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>9. Транспортное средство ввозится для личного пользования:</td>
			</tr>
			<tr>
				<td>
					<xsl:if test="$root/rd:DocType = 0">
						<xsl:apply-templates select="$root/rd:UtilCollDetails[1]/rd:Vehicle/rd:PersonalUseIndicator" mode="yes_no"/>
					</xsl:if>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>10. Транспортное средство ввозится с территории Республики Белоруссия:</td>
			</tr>
			<tr>
				<td>
					<xsl:if test="$root/rd:DocType = 0">
						<xsl:apply-templates select="$root/rd:UtilCollDetails[1]/rd:ImportRBSign" mode="yes_no"/>
					</xsl:if>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>11. Номер декларации на товары (таможенного приходного ордера) при таможенном декларировании (при наличии)<sup>6</sup>
				</td>
			</tr>
			<tr>
				<td class="border-bottom">
						<xsl:if test="$root/rd:UtilCollDetails[generate-id() = generate-id(key('typeKC_TD', rd:CustomsDeclarationIdDetails)[1])]">
							<xsl:text>ДТ: </xsl:text>
							<xsl:for-each select="$root/rd:UtilCollDetails[generate-id() = generate-id(key('typeKC_TD', rd:CustomsDeclarationIdDetails)[1])]">
								<xsl:if test="position()!=1">, </xsl:if>
								<xsl:apply-templates select="rd:CustomsDeclarationIdDetails" mode="RegNum"/>
							</xsl:for-each>
							<xsl:text>   </xsl:text>
						</xsl:if>
						<xsl:if test="$root/rd:UtilCollDetails[generate-id() = generate-id(key('typeKC_TPO', rd:TPORegNumber)[1])]">
							<xsl:text>ТПО: </xsl:text>
							<xsl:for-each select="$root/rd:UtilCollDetails[generate-id() = generate-id(key('typeKC_TPO', rd:TPORegNumber)[1])]">
								<xsl:if test="position()!=1">, </xsl:if>
								<xsl:apply-templates select="rd:TPORegNumber" mode="RegNum"/>
							</xsl:for-each>
						</xsl:if>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>12. Реквизиты документов, представление которых предусмотрено одновременно с подачей расчета утилизационного сбора:</td>
			</tr>
			<xsl:for-each select="$root/rd:UtilCollDetails/*[local-name() = 'PresentedDocument' or local-name() = 'TransportDocument'][generate-id() = generate-id(key('typeKC_Docs', concat(cat_ru:PrDocumentNumber, cat_ru:PrDocumentDate, RUScat_ru:DocKindCode)))]">
				<tr>
					<td class="border-bottom">
						<xsl:value-of select="position()"/>
						<xsl:text>) </xsl:text>
						<xsl:apply-templates select="." mode="Docs"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<table>
			<tr align="left">
				<td>Прошу уведомить меня о принятии (отказе в принятии) расчета утилизационного сбора:</td>
			</tr>
			<tr align="left">
				<td>
					<xsl:choose>
						<xsl:when test="rd:DecisionNotificationMethod[(rd:MethodKind='1')]">
							<input type="checkbox" id="vehicle1" name="vehicle1" value="true" checked="checked" disabled="disabled"/>
						</xsl:when>
						<xsl:otherwise>
							<input type="checkbox" id="vehicle2" name="vehicle2" value="false" disabled="disabled"/>
						</xsl:otherwise>
					</xsl:choose> в личном кабинете участника внешнеэкономической деятельности
		</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>
					<xsl:choose>
						<xsl:when test="$root/rd:DecisionNotificationMethod[(rd:MethodKind='2')]">
							<input type="checkbox" id="vehicle1" name="vehicle1" value="true" checked="checked" disabled="disabled"/>
						</xsl:when>
						<xsl:otherwise>
							<input type="checkbox" id="vehicle2" name="vehicle2" value="false" disabled="disabled"/>
						</xsl:otherwise>
					</xsl:choose> по почтовому адресу
		</td>
				<td style="width: 84%; vertical-align: baseline;" class="border-bottom">
					<xsl:value-of select="$root/rd:DecisionNotificationMethod[(rd:MethodKind='2')]/rd:MethodID"/>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>
					<xsl:choose>
						<xsl:when test="$root/rd:DecisionNotificationMethod[(rd:MethodKind='3' or rd:MethodKind='4')]">
							<input type="checkbox" id="vehicle1" name="vehicle1" value="true" checked="checked" disabled="disabled"/>
						</xsl:when>
						<xsl:otherwise>
							<input type="checkbox" id="vehicle2" name="vehicle2" value="false" disabled="disabled"/>
						</xsl:otherwise>
					</xsl:choose> по телефону 8 
		<!--/td>
				<td style="width:270px;"-->
					<xsl:choose>
						<xsl:when test="string-length($root/rd:DecisionNotificationMethod[(rd:MethodKind='3' or rd:MethodKind='4')]/rd:MethodID) &gt; 3">
							(<u>
								<xsl:value-of select="substring($root/rd:DecisionNotificationMethod[(rd:MethodKind='3' or rd:MethodKind='4')]/rd:MethodID,1,3)"/>
							</u>)
							<u>
								<xsl:value-of select="substring($root/rd:DecisionNotificationMethod[(rd:MethodKind='3' or rd:MethodKind='4')]/rd:MethodID,4)"/>
							</u>
						</xsl:when>
						<xsl:otherwise>
							(________)_____________________ 
						</xsl:otherwise>
					</xsl:choose>
				<!--/td>
				<td-->
				<xsl:text> посредством </xsl:text><!--СМС
					<xsl:choose>
						<xsl:when test="rd:DecisionNotificationMethod[(rd:MethodKind='3')]">
							<input type="checkbox" id="vehicle1" name="vehicle1" value="true" checked="checked" disabled="disabled"/>
						</xsl:when>
						<xsl:otherwise>
							<input type="checkbox" id="vehicle2" name="vehicle2" value="false" disabled="disabled"/>
						</xsl:otherwise>
					</xsl:choose> 
					или -->Telegram
					<xsl:choose>
						<xsl:when test="$root/rd:DecisionNotificationMethod[(rd:MethodKind='4')]">
							<input type="checkbox" id="vehicle1" name="vehicle1" value="true" checked="checked" disabled="disabled"/>
						</xsl:when>
						<xsl:otherwise>
							<input type="checkbox" id="vehicle2" name="vehicle2" value="false" disabled="disabled"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<!--td>
					
				</td-->
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>
					<xsl:choose>
						<xsl:when test="$root/rd:DecisionNotificationMethod[(rd:MethodKind='5')]">
							<input type="checkbox" id="vehicle1" name="vehicle1" value="true" checked="checked" disabled="disabled"/>
						</xsl:when>
						<xsl:otherwise>
							<input type="checkbox" id="vehicle2" name="vehicle2" value="false" disabled="disabled"/>
						</xsl:otherwise>
					</xsl:choose> по адресу электронной почты
		</td>
				<td style="width: 80%; vertical-align: baseline;" class="border-bottom">
					<xsl:value-of select="$root/rd:DecisionNotificationMethod[(rd:MethodKind='5')]/rd:MethodID"/>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td align="left">
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="70%">
									<table>
										<tbody>
											<tr align="center" valign="bottom">
												<td width="50%" style="border-bottom:1px solid black;">
													<xsl:apply-templates select="rd:ApproverPerson" mode="Wheel"/>
												</td>
												<td width="5%"/>
												<td width="20%" style="border-bottom:1px solid black;"/>
												<td width="5%"/>
												<td width="20%" style="border-bottom:1px solid black;">
													<xsl:apply-templates select="$root/rd:ApproverPerson/*[local-name() = 'IssueDate']" mode="russian_date"/>
												</td>
											</tr>
											<tr align="center" valign="top">
												<td class="graphLittle">(фамилия, имя, отчество (при наличии) руководителя (полномочного представителя) организации или физического лица)</td>
												<td/>
												<td class="graphLittle">(подпись)</td>
												<td/>
												<td class="graphLittle">(дата)</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="30%"/>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="WheelPart2">
		<xsl:param name="person"/>
		<xsl:variable name="root" select="$person/.."/>
		<xsl:variable name="payer" select="$root/rd:Payer[1]"/>
		<xsl:variable name="payer2" select="rd:Payer[(rd:DebtorPayerIndicator = 1 or translate(substring(rd:DebtorPayerIndicator, 1, 1), 'T', 't') = 't') and count($root/rd:Payer) &gt; 1][1]"/>
		<br/>
		<br/>
		<table>
			<tr align="center">
				<td>II. Заполняется должностным лицом таможенного органа</td>
			</tr>
			<tr>
				<td>1. Сведения о плательщике:</td>
			</tr>
		</table>
		<table>
			<tr style="text-indent: 5mm;">
				<td>полное наименование плательщика (фамилия, имя, отчество физического лица):</td>
				<td style="width: 51%;" class="border-bottom">
					<xsl:apply-templates select="$payer" mode="PayerName"/>
				</td>
			</tr>
		</table>
		<table>
			<tr style="text-indent: 5mm;">
				<td>ИНН/КПП (при наличии):</td>
				<td style="width: 83%;" class="border-bottom">
					<xsl:apply-templates select="$payer" mode="PayerInnKpp"/>
				</td>
			</tr>
		</table>
		<table>
			<tr style="text-indent: 5mm;">
				<td>ОГРН, дата регистрации (паспортные данные физического лица):</td>
				<td style="width: 59%;" class="border-bottom">
					<xsl:apply-templates select="$payer" mode="PayerOgrn"/>
				</td>
			</tr>
		</table>
		<table>
			<tr style="text-indent: 5mm;">
				<td>место нахождения (место жительства (адрес) физического лица):</td>
				<td style="width: 59%;" class="border-bottom">
					<xsl:apply-templates select="$payer" mode="PayerAddress"/>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td>2. Сведения о лице, которое приобрело колесное транспортное средство (шасси) и (или) прицеп на территории Российской Федерации у лица, не уплачивающего утилизационный сбор в соответствии с абзацами вторым и третьим пункта 6 статьи 24.1 Федерального закона «Об отходах производства и потребления», или у лица, не уплатившего в нарушение установленного порядка утилизационного сбора:</td>
			</tr>
		</table>
		<table>
			<tr style="text-indent: 5mm;">
				<td>полное наименование плательщика (фамилия, имя, отчество физического лица):</td>
				<td style="width: 51%;" class="border-bottom">
					<xsl:apply-templates select="$payer2" mode="PayerName"/>
				</td>
			</tr>
		</table>
		<table>
			<tr style="text-indent: 5mm;">
				<td>ИНН/КПП (при наличии):</td>
				<td style="width: 83%;" class="border-bottom">
					<xsl:apply-templates select="$payer2" mode="PayerInnKpp"/>
				</td>
			</tr>
		</table>
		<table>
			<tr style="text-indent: 5mm;">
				<td>ОГРН, дата регистрации (паспортные данные физического лица):</td>
				<td style="width: 59%;" class="border-bottom">
					<xsl:apply-templates select="$payer2" mode="PayerOgrn"/>
				</td>
			</tr>
		</table>
		<table>
			<tr style="text-indent: 5mm;">
				<td>место нахождения (место жительства (адрес) физического лица):</td>
				<td style="width: 59%;" class="border-bottom">
					<xsl:apply-templates select="$payer2" mode="PayerAddress"/>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>3. Сведения о лице, не состоящем на учете в налоговых органах Российской Федерации<sup>5</sup>, 
				</td>
				<td style="width: 45%;" class="border-bottom">
					<xsl:apply-templates select="$payer" mode="PayerUITN"/>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>4. Номер декларации на товары (таможенного приходного ордера) при таможенном декларировании (при наличии)<sup>6</sup>:
				</td>
				<td style="width: 32%;" class="border-bottom">
					<xsl:if test="$root/rd:DocType &gt; 0">
						<xsl:choose>
							<xsl:when test="$RecyclingDetailsMark">
								<xsl:if test="$RecyclingDetailsMark/rdm:DTNum">ДТ: </xsl:if>
								<xsl:apply-templates select="$RecyclingDetailsMark/rdm:DTNum" mode="RegNum"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="rd:UtilCollDetails[generate-id() = generate-id(key('typeKC_TD', rd:CustomsDeclarationIdDetails)[1])]">
									<xsl:text>ДТ: </xsl:text>
									<xsl:for-each select="rd:UtilCollDetails[generate-id() = generate-id(key('typeKC_TD', rd:CustomsDeclarationIdDetails)[1])]">
										<xsl:if test="position()!=1">, </xsl:if>
										<xsl:apply-templates select="rd:CustomsDeclarationIdDetails" mode="RegNum"/>
									</xsl:for-each>
									<xsl:text>   </xsl:text>
								</xsl:if>
								<xsl:if test="rd:UtilCollDetails[generate-id() = generate-id(key('typeKC_TPO', rd:TPORegNumber)[1])]">
									<xsl:text>ТПО: </xsl:text>
									<xsl:for-each select="rd:UtilCollDetails[generate-id() = generate-id(key('typeKC_TPO', rd:TPORegNumber)[1])]">
										<xsl:if test="position()!=1">, </xsl:if>
										<xsl:apply-templates select="rd:TPORegNumber" mode="RegNum"/>
									</xsl:for-each>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>5. Наименование и код таможенного органа:
				</td>
				<td style="width: 73%;" class="border-bottom">
					<xsl:if test="$root/rd:DocType &gt; 0">
						<xsl:choose>
							<xsl:when test="$RecyclingDetailsMark">
								<xsl:apply-templates select="$RecyclingDetailsMark/rdm:Customs"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="rd:Customs"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>6. Должность, фамилия, имя отчество (при наличии) должностного лица таможенного органа:
				</td>
				<td style="width: 45%;" class="border-bottom">
					<xsl:if test="$root/rd:DocType &gt; 0">
						<xsl:choose>
							<xsl:when test="$RecyclingDetailsMark">
								<xsl:apply-templates select="$RecyclingDetailsMark/rdm:CustomsPerson/cat_ru:PersonName"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="rd:CustomsPersonName"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>7. Дата составления расчета:
				</td>
				<td style="width: 82%;" class="border-bottom">
					<xsl:if test="$root/rd:DocType &gt; 0">
						<xsl:apply-templates select="rd:CalculateDate" mode="russian_date"/>
					</xsl:if>
				</td>
			</tr>
		</table>
		<table>
			<tr align="left">
				<td>8. Регистрационный номер расчета:
				</td>
				<td style="width: 77%;" class="border-bottom">
					<xsl:if test="$root/rd:DocType &gt; 0">
						<xsl:if test="$RecyclingDetailsMark">
							<xsl:apply-templates select="$RecyclingDetailsMark/rdm:RegNum" mode="RegNum"/>
						</xsl:if>
					</xsl:if>
				</td>
			</tr>
		</table>
		<br/>
	</xsl:template>
	<!-- /КОЛЕСНЫЕ -->
	
	<xsl:template match="*" mode="yes_no">
		<xsl:choose>
			<xsl:when test=". ='true' or .=1">
				<input type="checkbox" id="vehicle1" name="vehicle1" value="true" checked="checked" disabled="disabled"/> да <input type="checkbox" id="vehicle2" name="vehicle2" value="false" disabled="disabled"/> нет
			</xsl:when>
			<xsl:when test=". ='false' or .=0">
				<input type="checkbox" id="vehicle1" name="vehicle1" value="true" disabled="disabled"/> да <input type="checkbox" id="vehicle2" name="vehicle2" value="false" disabled="disabled" checked="checked"/> нет
			</xsl:when>
			<xsl:otherwise>
				<input type="checkbox" id="vehicle1" name="vehicle1" value="true" disabled="disabled"/> да <input type="checkbox" id="vehicle2" name="vehicle2" value="false" disabled="disabled"/> нет
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="Parts">
		<xsl:param name="sign1"/>
		<!-- лат -->
		<xsl:param name="sign2"/>
		<!-- рус -->
		<!-- часть 1 -->
		<xsl:call-template name="Part1">
			<xsl:with-param name="person" select="rd:DocType[. = 0]"/>
			<xsl:with-param name="sign1" select="$sign1"/>
			<xsl:with-param name="sign2" select="$sign2"/>
		</xsl:call-template>
		<br/>
		<!-- часть 2 -->
		<xsl:call-template name="Part2">
			<xsl:with-param name="person" select="rd:DocType[. &gt;= 1]"/>
			<xsl:with-param name="sign1" select="$sign1"/>
			<xsl:with-param name="sign2" select="$sign2"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="Part1">
		<xsl:param name="person"/>
		<xsl:param name="sign1"/>
		<!-- лат -->
		<xsl:param name="sign2"/>
		<!-- рус -->
		<xsl:variable name="root" select="$person/.."/>
		<!-- добавить root к XPath плательщика -->
		<xsl:variable name="payer" select="$root/rd:Payer[1]"/>
		<table>
			<tr>
				<td class="annot graphMain" colspan="2">1. Заполняется плательщиком или его уполномоченным представителем:</td>
			</tr>
			<tr>
				<td style="width:50%">1.1. Наименование (код) таможенного органа, в который подается расчет:</td>
				<td style="width:50%">
					<xsl:apply-templates select="$root/rd:Customs"/>
				</td>
			</tr>
			<tr>
				<td>1.2. Дата подачи расчета: </td>
				<td>
					<xsl:apply-templates select="$root/rd:CalculateDate" mode="russian_date"/>
				</td>
			</tr>
			<tr>
				<td>1.3. Полное наименование плательщика (фамилия, имя, отчество физического лица):</td>
				<td>
					<xsl:apply-templates select="$payer" mode="PayerName"/>
				</td>
			</tr>
			<tr>
				<td>1.4. ИНН/КПП (при наличии):</td>
				<td>
					<xsl:apply-templates select="$payer" mode="PayerInnKpp"/>
				</td>
			</tr>
			<tr>
				<td>1.5. ОГРН, дата регистрации (паспортные данные физического лица):</td>
				<td>
					<xsl:apply-templates select="$payer" mode="PayerOgrn"/>
				</td>
			</tr>
			<tr>
				<td>1.6. Место нахождения (место жительства (адрес) физического лица):</td>
				<td>
					<xsl:apply-templates select="$payer" mode="PayerAddress"/>
				</td>
			</tr>
			<tr>
				<td>1.7. Сведения о лице, не состоящем на учете в налоговых органах Российской Федерации:</td>
				<td>
					<xsl:apply-templates select="$payer" mode="PayerUITN"/>
				</td>
			</tr>
			<tr>
				<td>1.8. Номер декларации на товары (таможенного приходного ордера) при таможенном декларировании (при наличии):</td>
				<td>
					<xsl:if test="$payer/../rd:UtilCollDetails[rd:Sign=$sign1 or rd:Sign = $sign2][generate-id() = generate-id(key('typeKC_TD', rd:CustomsDeclarationIdDetails)[1])]">
						<xsl:text>ДТ: </xsl:text>
						<xsl:for-each select="$payer/../rd:UtilCollDetails[rd:Sign=$sign1 or rd:Sign = $sign2][generate-id() = generate-id(key('typeKC_TD', rd:CustomsDeclarationIdDetails)[1])]">
							<xsl:if test="position()!=1">, </xsl:if>
							<xsl:apply-templates select="rd:CustomsDeclarationIdDetails" mode="RegNum"/>
						</xsl:for-each>
						<br/>
					</xsl:if>
					<xsl:if test="$payer/../rd:UtilCollDetails[rd:Sign=$sign1 or rd:Sign = $sign2][generate-id() = generate-id(key('typeKC_TPO', rd:TPORegNumber)[1])]">
						<xsl:text>ТПО: </xsl:text>
						<xsl:for-each select="$payer/../rd:UtilCollDetails[rd:Sign=$sign1 or rd:Sign = $sign2][generate-id() = generate-id(key('typeKC_TPO', rd:TPORegNumber)[1])]">
							<xsl:if test="position()!=1">, </xsl:if>
							<xsl:apply-templates select="rd:TPORegNumber" mode="RegNum"/>
						</xsl:for-each>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td>1.9. Реквизиты документов, представление которых предусмотрено одновременно с подачей расчета утилизационного сбора:</td>
				<td>
					<xsl:for-each select="$payer/../rd:UtilCollDetails[rd:Sign=$sign1 or rd:Sign = $sign2]/*[local-name() = 'PresentedDocument' or local-name() = 'TransportDocument'][generate-id() = generate-id(key('typeKC_Docs', concat(cat_ru:PrDocumentNumber, cat_ru:PrDocumentDate, RUScat_ru:DocKindCode))[1])]">
						<xsl:if test="position() != 1">
							<br/>
						</xsl:if>
						<xsl:value-of select="position()"/>
						<xsl:text>) </xsl:text>
						<xsl:apply-templates select="." mode="Docs"/>
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<td>1.10. (фамилия, имя, отчество руководителя (подпись) (дата) (полномочного представителя) организации или физического лица) М.П. (при наличии):</td>
				<td>
					<xsl:apply-templates select="$root/rd:ApproverPerson"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="Part2">
		<xsl:param name="person"/>
		<xsl:param name="sign1"/>
		<!-- лат -->
		<xsl:param name="sign2"/>
		<!-- рус -->
		<xsl:variable name="root" select="$person/.."/>
		<xsl:variable name="payer" select="$root/rd:Payer[1]"/>
		<xsl:variable name="payer2" select="rd:Payer[(rd:DebtorPayerIndicator = 1 or translate(substring(rd:DebtorPayerIndicator, 1, 1), 'T', 't') = 't') and count($root/rd:Payer) &gt; 1][1]"/>
		<table>
			<tr>
				<td class="annot graphMain" colspan="2">2. Заполняется должностным лицом таможенного органа:</td>
			</tr>
			<tr>
				<td class="annot graphMain" colspan="2">2.1. Сведения о плательщике:</td>
			</tr>
			<tr>
				<td style="width:50%">2.1.1 Полное наименование плательщика (фамилия, имя, отчество физического лица):</td>
				<td style="width:50%">
					<xsl:apply-templates select="$payer" mode="PayerName"/>
				</td>
			</tr>
			<tr>
				<td>2.1.2. ИНН/КПП (при наличии):</td>
				<td>
					<xsl:apply-templates select="$payer" mode="PayerInnKpp"/>
				</td>
			</tr>
			<tr>
				<td>2.1.3. ОГРН, дата регистрации (паспортные данные физического лица):</td>
				<td>
					<xsl:apply-templates select="$payer" mode="PayerOgrn"/>
				</td>
			</tr>
			<tr>
				<td>2.1.4. Место нахождения (место жительства (адрес) физического лица):</td>
				<td>
					<xsl:apply-templates select="$payer" mode="PayerAddress"/>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" colspan="2">2.2. Сведения о лице, которое приобрело колесное транспортное средство (шасси) и (или) прицеп на территории Российской Федерации у лица, не уплачивающего утилизационный сбор в соответствии с абзацами вторым и третьим пункта 6 статьи 24.1 Федерального закона «Об отходах производства и потребления», или у лица, не уплатившего в нарушение установленного порядка утилизационного сбора:</td>
			</tr>
			<tr>
				<td>2.2.1. Полное наименование плательщика (фамилия, имя, отчество физического лица):</td>
				<td>
					<xsl:apply-templates select="$payer2" mode="PayerName"/>
				</td>
			</tr>
			<tr>
				<td>2.2.2. ИНН/КПП (при наличии):</td>
				<td>
					<xsl:apply-templates select="$payer2" mode="PayerInnKpp"/>
				</td>
			</tr>
			<tr>
				<td>2.2.3. ОГРН, дата регистрации (паспортные данные физического лица):</td>
				<td>
					<xsl:apply-templates select="$payer2" mode="PayerOgrn"/>
				</td>
			</tr>
			<tr>
				<td>2.2.4. Место нахождения (место жительства (адрес) физического лица):</td>
				<td>
					<xsl:apply-templates select="$payer2" mode="PayerAddress"/>
				</td>
			</tr>
			<tr>
				<td>2.2.5. Сведения о лице, не состоящем на учете в налоговых органах Российской Федерации:</td>
				<td>
					<xsl:apply-templates select="$payer" mode="PayerUITN"/>
				</td>
			</tr>
			<tr>
				<td>2.2.6. Номер декларации на товары (таможенного приходного ордера) при таможенном декларировании (при наличии):</td>
				<td>
					<xsl:if test="$root/rd:DocType &gt; 0">
						<xsl:choose>
							<xsl:when test="$RecyclingDetailsMark">
								<xsl:text>ДТ: </xsl:text>
								<xsl:apply-templates select="rdm:DTNum" mode="RegNum"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="$payer/../rd:UtilCollDetails[rd:Sign=$sign1 or rd:Sign = $sign2][generate-id() = generate-id(key('typeKC_TD', rd:CustomsDeclarationIdDetails)[1])]">
									<xsl:text>ДТ: </xsl:text>
									<xsl:for-each select="$payer/../rd:UtilCollDetails[rd:Sign=$sign1 or rd:Sign = $sign2][generate-id() = generate-id(key('typeKC_TD', rd:CustomsDeclarationIdDetails)[1])]">
										<xsl:if test="position()!=1">, </xsl:if>
										<xsl:apply-templates select="rd:CustomsDeclarationIdDetails" mode="RegNum"/>
									</xsl:for-each>
									<br/>
								</xsl:if>
								<xsl:if test="$payer/../rd:UtilCollDetails[rd:Sign=$sign1 or rd:Sign = $sign2][generate-id() = generate-id(key('typeKC_TPO', rd:TPORegNumber)[1])]">
									<xsl:text>ТПО: </xsl:text>
									<xsl:for-each select="$payer/../rd:UtilCollDetails[rd:Sign=$sign1 or rd:Sign = $sign2][generate-id() = generate-id(key('typeKC_TPO', rd:TPORegNumber)[1])]">
										<xsl:if test="position()!=1">, </xsl:if>
										<xsl:apply-templates select="rd:TPORegNumber" mode="RegNum"/>
									</xsl:for-each>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td>2.3. Наименование и код таможенного органа:</td>
				<td>
						<xsl:choose>
							<xsl:when test="$RecyclingDetailsMark">
								<xsl:apply-templates select="rdm:Customs"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="$root/rd:Customs"/>
							</xsl:otherwise>
						</xsl:choose>
				</td>
			</tr>
			<tr>
				<td>2.4. Должность, фамилия, имя отчество (при наличии) должностного лица таможенного органа:</td>
				<td>
					<xsl:if test="$root/rd:DocType &gt; 0">
						<xsl:choose>
							<xsl:when test="$RecyclingDetailsMark">
								<xsl:apply-templates select="$RecyclingDetailsMark/rdm:CustomsPerson/cat_ru:PersonName"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="$root/rd:CustomsPersonName"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td>2.5. Дата составления расчета: </td>
				<td>
					<xsl:if test="$root/rd:DocType &gt; 0">
						<xsl:apply-templates select="$root/rd:CalculateDate" mode="russian_date"/>
					</xsl:if>
				</td>
			</tr>
			<xsl:if test="$sign1 = 'K' or $sign1 = 'К'">
				<tr>
					<td>2.6. Регистрационный номер расчета: </td>
					<td>
						<xsl:if test="$root/rd:DocType &gt; 0">
							<xsl:if test="$RecyclingDetailsMark">
								<xsl:apply-templates select="$RecyclingDetailsMark/rdm:RegNum" mode="RegNum"/>
							</xsl:if>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>

	<xsl:template match="*" mode="Docs">
		<xsl:apply-templates select="*[local-name() = 'PrDocumentName']"/>
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text> №</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="docShort">
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text> №</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'Customs']">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:OfficeName"> (</xsl:if>
		<xsl:apply-templates select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">)</xsl:if>
	</xsl:template>
	<xsl:template match="rd:ApproverPerson" mode="Wheel">
		<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonName']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonMiddleName']"/>
	</xsl:template>
	<xsl:template match="rd:ApproverPerson">
		<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonName']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonMiddleName']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IssueDate']" mode="russian_date"/>
	</xsl:template>
	<xsl:template match="rd:CustomsPersonName">
		<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonName']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonMiddleName']"/>
	</xsl:template>
	<xsl:template match="rd:Payer" mode="PayerName">
		<xsl:if test="rd:PayerName">
			<xsl:apply-templates select="rd:PayerName"/>
			<xsl:if test="rd:PayerName and rd:ShortName">
				<xsl:text> (</xsl:text>
			</xsl:if>
			<xsl:apply-templates select="rd:ShortName"/>
			<xsl:if test="rd:PayerName and rd:ShortName">
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
		<xsl:if test="rd:Person">
			<xsl:apply-templates select="rd:Person/rd:PersonSurname"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="rd:Person/rd:PersonName"/>
			<xsl:if test="rd:Person/rd:PersonMiddleName">
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="rd:Person/rd:PersonMiddleName"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="rd:Payer" mode="PayerInnKpp">
		<xsl:apply-templates select="rd:RFOrganizationFeatures/cat_ru:INN"/>
		<xsl:if test="rd:RFOrganizationFeatures/cat_ru:INN">
			<xsl:text> / </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="rd:RFOrganizationFeatures/cat_ru:KPP"/>
	</xsl:template>
	<xsl:template match="rd:Payer" mode="PayerOgrn">
		<xsl:apply-templates select="rd:RFOrganizationFeatures/cat_ru:OGRN"/>
		<xsl:if test="rd:PayerRegDate">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="rd:PayerRegDate" mode="russian_date"/>
		<xsl:if test="rd:RFOrganizationFeatures/cat_ru:OGRN and rd:IdentityDoc">
			<xsl:text>, паспорт: </xsl:text>
		</xsl:if>
		<xsl:apply-templates mode="IdentityCard" select="rd:IdentityDoc"/>
	</xsl:template>
	<xsl:template match="rd:Payer" mode="PayerAddress">
		<xsl:choose>
			<xsl:when test="rd:TPOAddress">
				<xsl:apply-templates select="rd:TPOAddress" mode="ru_address"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>отсутствует</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="rd:Payer" mode="PayerUITN">
		<xsl:for-each select="rd:UITN/*">
			<xsl:if test="position() != 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="FIO">
		<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
		<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonName']"/>
		<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonMiddleName']"/>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:apply-templates select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:apply-templates select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:apply-templates select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:apply-templates select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:apply-templates select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:apply-templates select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#160;(<xsl:apply-templates select="RUScat_ru:CountryCode"/>)</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">Код ОПФ: <xsl:apply-templates select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId"> (по справ. <xsl:apply-templates select="RUScat_ru:CodeListId"/>)</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template mode="CommunicationDetails" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='Phone'">
					<xsl:text>тел: </xsl:text>
				</xsl:when>
				<xsl:when test="local-name()='Fax'">
					<xsl:text>факс: </xsl:text>
				</xsl:when>
				<xsl:when test="local-name()='Telex'">
					<xsl:text>телекс: </xsl:text>
				</xsl:when>
				<xsl:when test="local-name()='E_mail'">
					<xsl:text>e-mail: </xsl:text>
				</xsl:when>
			</xsl:choose>
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--rd:TPORegNumberType-->
	<xsl:template match="*" mode="RegNum">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'DocNumber' or local-name() = 'GTDNumber']"/>
		<xsl:apply-templates select="*[local-name() = 'NumPP']"/>
		<xsl:if test="*[local-name() = 'AddNumber']">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AddNumber']"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="*" mode="GTDID">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template mode="IdentityCard" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>(окончание срока действия: </xsl:text>
					<xsl:apply-templates select="." mode="russian_date"/>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:variable name="xpath_AddressKindCode">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="RUScat_ru:AddressKindCode"/>
						</xsl:call-template>
					</xsl:variable>
					<element xml_node="{$xpath_AddressKindCode}">
						<xsl:choose>
							<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						</xsl:choose>
					</element>
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
							<xsl:variable name="xpath_AddressKindCode1">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_AddressKindCode1}">
								<xsl:choose>
									<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
									<xsl:when test=".='2'">Фактический адрес: </xsl:when>
									<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								</xsl:choose>
							</element>
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
	<xsl:template match="//*[local-name()='RecyclingDetails']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
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
	<xsl:template match="*" mode="transl">
		<xsl:variable name="xpath_transl">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_transl}">
			<xsl:value-of select="translate(format-number(., '0.00'), '.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
