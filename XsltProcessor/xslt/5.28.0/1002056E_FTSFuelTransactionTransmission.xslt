<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:fftt="urn:customs.ru:Information:CommercialFinanceDocuments:FTSFuelTransactionTransmission:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа FTSFuelTransactionTransmissionType -->
	<xsl:template match="fftt:FTSFuelTransactionTransmission">
		<xsl:param name="w" select="277"/>
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
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Расходный ордер на заправку воздушных судов</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="fftt:FuelTransactionTransmissionHeader">
						<div class="title marg-top">Шапка пакета документов</div>
						<div>
							<xsl:apply-templates select="fftt:FuelTransactionTransmissionHeader">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<div class="title marg-top">Список документов</div>

					<xsl:apply-templates select="fftt:FuelTransaction">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>

					<xsl:if test="fftt:FuelTransactionTransmissionSummary">
						<div class="title marg-top">Итоги по документам пакета</div>
						<div>
							<xsl:apply-templates select="fftt:FuelTransactionTransmissionSummary">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа fftt:DensityInformationType -->
	<xsl:template match="fftt:DensityInformation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>

		<xsl:apply-templates select="fftt:DensityType"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="fftt:Density" mode="translate_number"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="fftt:DensityUOM"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="fftt:Temperature" mode="translate_number"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="fftt:TUOM"/>

	</xsl:template>
	<xsl:template match="fftt:DensityUOM">
		<!-- KGM – кг/м3, KGL – кг/л, LGH – фут/галлон -->
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 'KGM'">кг/м3</xsl:when>
				<xsl:when test=". = 'KGL'">кг/л</xsl:when>
				<xsl:when test=". = 'LGH'">фут/галлон</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template match="fftt:DensityType">
		<!-- Принимает значение: MEA – измеренная плотность, STD – стандартная плотность -->
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 'MEA'">измеренная плотность</xsl:when>
				<xsl:when test=". = 'STD'">стандартная плотность</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<!-- Шаблон для типа fftt:EquipmentType -->
	<xsl:template match="fftt:Equipment">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="fftt:FuelingEquipmentID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="fftt:FuelingType"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="fftt:PITNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="fftt:Operator"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="fftt:AverageFuelTemperature" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="fftt:TUOM"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="fftt:DensityInformation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="fftt:MeterReading">
						<xsl:apply-templates select="fftt:MeterReading">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа fftt:FlightInformationType -->
	<xsl:template match="fftt:FlightInformation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер рейса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:AirlineFlightID"/>
					</td>
				</tr>
			</table>
			<xsl:if test="fftt:AirlineLegID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор плеча маршрута</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:AirlineLegID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Бортовой номер воздушного судна</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:AircraftIdentification"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Признак вылета за границу</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="fftt:InternationalFlight='true' or fftt:InternationalFlight='1'">
								<xsl:text>ДА</xsl:text>
							</xsl:when>
							<xsl:when test="fftt:InternationalFlight='false' or fftt:InternationalFlight='0'">
								<xsl:text>НЕТ</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="fftt:InternationalFlight"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:if test="fftt:TicketReferenceValue">
				<div class="title marg-top">Дополнительная информация по рейсу</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Дополнительная информация по рейсу</td>
							<td class="graphMain bordered">Атрибут дополнительной иинформации по рейсу</td>
						</tr>
						<xsl:for-each select="fftt:TicketReferenceValue">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="fftt:FlightType">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Тип рейса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:FlightType"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="fftt:ScheduledFlightDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата рейса по расписанию</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:ScheduledFlightDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template match="fftt:FlightType">
		<!-- Принимает значение: P – пассажирский, C – грузовой, M – военный, CH – чартерный, FF – технический, TF – тестовый, TR – тренировочный -->
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 'P'">пассажирский</xsl:when>
				<xsl:when test=". = 'C'">грузовой</xsl:when>
				<xsl:when test=". = 'M'">военный</xsl:when>
				<xsl:when test=". = 'CH'">чартерный</xsl:when>
				<xsl:when test=". = 'FF'">технический</xsl:when>
				<xsl:when test=". = 'TF'">тестовый</xsl:when>
				<xsl:when test=". = 'TR'">тренировочный</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<!-- Шаблон для типа fftt:IPTransactionType -->
	<xsl:template match="fftt:FuelTransaction">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<div class="title marg-top" style="background-color: #aaa;">Сведения о документе #<xsl:value-of select="position()"/></div>
			<xsl:apply-templates select="fftt:Header">
				<xsl:with-param name="wdth" select="$w"/>
			</xsl:apply-templates>

			<xsl:apply-templates select="fftt:FlightInformation">
				<xsl:with-param name="wdth" select="$w"/>
			</xsl:apply-templates>
			
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Условия оплаты</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:PaymentInformation"/>
					</td>
				</tr>
			</table>

			<xsl:apply-templates select="fftt:IPTLine">
				<xsl:with-param name="wdth" select="$w"/>
			</xsl:apply-templates>

			<xsl:apply-templates select="fftt:Summary">
				<xsl:with-param name="wdth" select="$w"/>
			</xsl:apply-templates>
			
		</div>
	</xsl:template>
	<xsl:template match="fftt:PaymentInformation">
		<!-- Принимает значение: CA – наличные, CC – кредитная карта, CO – заправка по договору, CN – чековая книжка -->
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 'CA'">наличные</xsl:when>
				<xsl:when test=". = 'CC'">кредитная карта</xsl:when>
				<xsl:when test=". = 'СO'">заправка по долгу</xsl:when>
				<xsl:when test=". = 'CN'">чековая книжка</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<!-- Шаблон для типа fftt:FuelTransactionTransmissionHeaderType -->
	<xsl:template match="fftt:FuelTransactionTransmissionHeader">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификатор файла передачи данных</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:FuelTransactionTransmissionId"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время создания файла одного пакета документов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:FuelTransactionCreationDate" mode="russian_date"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(fftt:FuelTransactionCreationDate, 12, 5)"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Версия стандарта, по которой создан пакет документов (Принимает значение 3.3.0)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:FuelTransactionVersion"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа fftt:FuelTransactionTransmissionSummaryType -->
	<xsl:template match="fftt:FuelTransactionTransmissionSummary">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество заправок в документе</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:FuelTransactionMessageCount"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество топливной смеси в документе</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:FuelTransactionTotalFuelQuantity" mode="translate_number"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа fftt:HeaderType -->
	<xsl:template match="fftt:Header">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код IATA топливозаправочной компании</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:IntoPlaneCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование топливозаправочной компании</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:IntoPlaneName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="fftt:IntoPlaneLocalTaxID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН топливозаправочной компании </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:IntoPlaneLocalTaxID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="fftt:IntoPlaneLocalTaxRegistrationReasonCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП топливозаправочной компании </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:IntoPlaneLocalTaxRegistrationReasonCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код IATA аэропорта вылета</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:AirportCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:TicketNumber"/>
					</td>
				</tr>
			</table>
			<xsl:if test="fftt:TicketNumberAtr">
				<div class="title marg-top">Атрибуты документа</div>
				<div>
					<xsl:apply-templates select="fftt:TicketNumberAtr">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="fftt:UniqueTicketID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:UniqueTicketID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="fftt:PreviousTicketNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер предыдущего документа. Для заправок в крыло номер предыдущего расходного ордера.</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:PreviousTicketNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата документа (дата и время заправки)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:TransactionDate" mode="russian_date"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(fftt:TransactionDate, 12, 5)"/>
					</td>
				</tr>
			</table>
			<xsl:if test="fftt:Comments">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дополнительная информация</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="fftt:Comments">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа fftt:IPTLineType -->
	<xsl:template match="fftt:IPTLine">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="fftt:IPTransactionType">
				<div class="title marg-top">Тип транзакции</div>
				<div>
					<xsl:apply-templates select="fftt:IPTransactionType">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="fftt:TransactionParties">
				<div class="title marg-top">Тип операции (продажа или передача без продажи)</div>
				<div>
					<xsl:apply-templates select="fftt:TransactionParties">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="fftt:MovementInformation">
				<div class="title marg-top">Информация о продукте и его количестве</div>
				<div>
					<xsl:apply-templates select="fftt:MovementInformation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа fftt:IPTransactionCodeType -->
	<xsl:template match="fftt:IPTransactionType">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код транзакции</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="fftt:IPTransactionCode='DE'">
								<xsl:text>слив</xsl:text>
							</xsl:when>
							<xsl:when test="fftt:IPTransactionCode='FU'">
								<xsl:text>заправка</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="fftt:IPTransactionCode"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа fftt:MeterCertificationInfoType -->
	<xsl:template match="fftt:MeterCertificationInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>

						<xsl:apply-templates select="fftt:MeterCertificationID"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="fftt:MeterCertificationExpDate" mode="russian_date"/>
	</xsl:template>
	<!-- Шаблон для типа fftt:MeterReadingType -->
	<xsl:template match="fftt:MeterReading">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="fftt:MQDUOM">
		<!-- M3 – метр кубический, KG – килограмм, LT - литр, MT – метрическая тонна, USG - галлон -->
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 'M3'">м3</xsl:when>
				<xsl:when test=". = 'KG'">кг</xsl:when>
				<xsl:when test=". = 'LT'">л</xsl:when>
				<xsl:when test=". = 'MT'">метрическая тонна</xsl:when>
				<xsl:when test=". = 'USG'">галлон</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<!-- Шаблон для типа fftt:MovementInfirmationType -->
	<xsl:template match="fftt:MovementInformation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="fftt:Direction">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Направление движения топлива</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:Direction"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<div class="title marg-top">Информация о продукте</div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Код продукта</td>
						<td class="graphMain bordered">Особенности продукта для таможни</td>
						<td class="graphMain bordered">Код продукта - уточнение</td>
						<td class="graphMain bordered">Описание продукта</td>
						<td class="graphMain bordered">Процент дополнительных жидкостей в топливе</td>
					</tr>
					<xsl:for-each select="fftt:ProductInformation">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
			<xsl:if test="fftt:StandNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Местоположение доставки топлива</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:StandNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<div class="title marg-top">Информация о заправщике, количестве, температуре и плотности</div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Информация по топливозаправщику</td>
						<td class="graphMain bordered">Тип транспорта</td>
						<td class="graphMain bordered">Номер гидранта</td>
						<td class="graphMain bordered">ФИО или идентификатор исполнителя заправки<br/>(Водителя ТЗА)</td>
						<td class="graphMain bordered">Температура заправки</td>
						<td class="graphMain bordered">Единица измерения температуры</td>
						<td class="graphMain bordered">Информация о плотности</td>
						<td class="graphMain bordered">Показания счетчика</td>
					</tr>
					<xsl:for-each select="fftt:Equipment">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
			<xsl:if test="fftt:TotalQuantityKG">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Количество топлива (в КГ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:TotalQuantityKG" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="fftt:TotalQuantityL">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Количество топлива (в литрах)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:TotalQuantityL" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="fftt:TQDFlag">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак веса: GR – нетто, NT – брутто</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:TQDFlag"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="fftt:TQDUOM">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак количества</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:TQDUOM"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="fftt:TransactionTime">
				<div class="title marg-top">Время заправки</div>
				<div>
					<xsl:apply-templates select="fftt:TransactionTime">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template match="fftt:TQDFlag">
		<!-- GR – нетто, NT – брутто -->
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 'GR'">нетто</xsl:when>
				<xsl:when test=". = 'NT'">брутто</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template match="fftt:Direction">
		<!-- Принимает значение: TO – заправка, FR – слив -->
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 'TO'">заправка</xsl:when>
				<xsl:when test=". = 'FR'">слив</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<!-- Шаблон для типа fftt:ProductInformationType -->
	<xsl:template match="fftt:ProductInformation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="fftt:ProductID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="fftt:ProductIDCustoms"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="fftt:ProductIDQualifier"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="fftt:ProductDescription"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="fftt:ProductPercentage" mode="translate_number"/>
				</td>
			</tr>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа fftt:SummaryType -->
	<xsl:template match="fftt:Summary">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество строк с заправками</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:FuelTransactionLineCount"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Общее количество топлива</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:TotalFuelQuantity" mode="translate_number"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа fftt:TicketNumberAtrType -->
	<xsl:template match="fftt:TicketNumberAtr">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Тип документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:TicketType"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Источник документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:TicketSource"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Статус документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:TicketStatus"/>
					</td>
				</tr>
			</table>
			<xsl:if test="fftt:TicketCancelOperator">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Статус отмены оператором</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:TicketCancelOperator"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template match="fftt:TicketCancelOperator">
		<!-- Принимает значение: P – отменен, N – перевыпущен -->
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 'P'">отменен</xsl:when>
				<xsl:when test=". = 'N'">перевыпущен</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template match="fftt:TicketStatus">
		<!-- Принимает значение: P – предварительный, F – финальный -->
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 'P'">предварительный</xsl:when>
				<xsl:when test=". = 'F'">финальный</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template match="fftt:TicketSource">
		<!-- Принимает значение: M – бумажный, Е – электронный -->
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 'M'">бумажный</xsl:when>
				<xsl:when test=". = 'E'">электронный</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template match="fftt:TicketType">
		<!--  Принимает значение: O – действующий, R – измененный, C – отклоненный, D – удаленный -->
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 'O'">действующий</xsl:when>
				<xsl:when test=". = 'R'">измененный</xsl:when>
				<xsl:when test=". = 'С'">отклоненный</xsl:when>
				<xsl:when test=". = 'В'">удаленный</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<!-- Шаблон для типа fftt:TicketReferenceValueType -->
	<xsl:template match="fftt:TicketReferenceValue">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="fftt:TicketReferenceValue" mode="subNode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="fftt:ValueType"/>
				</td>
			</tr>
		<!--/div-->
	</xsl:template>
	<xsl:template match="fftt:TicketReferenceValue" mode="subNode">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="."/>
		</element>
	</xsl:template>
	<!-- Шаблон для типа fftt:SaleType -->
	<xsl:template match="fftt:TransactionParties">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код IATA грузополучателя (авиакомпании)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:ReceiverCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование грузополучателя (авиакомпании)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:ReceiverName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="fftt:ReceiverLocalTaxID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН грузополучателя (авиакомпании)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:ReceiverLocalTaxID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="fftt:ReceiverLocalTaxRegistrationReasonCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП грузополучателя (авиакомпании)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:ReceiverLocalTaxRegistrationReasonCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Представитель грузополучателя (авиакомпании). Указывается ФИО или идентификатор физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:ReceiverRepresentative"/>
					</td>
				</tr>
			</table>
			<xsl:if test="fftt:BuyerCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код IATA покупателя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:BuyerCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="fftt:BuyerName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование покупателя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:BuyerName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="fftt:BuyerLocalTaxID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН покупателя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:BuyerLocalTaxID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="fftt:BuyerLocalTaxRegistrationReasonCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП покупателя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:BuyerLocalTaxRegistrationReasonCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код  страны регистрации покупателя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:BuyerResidenceCountryCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер счета получателя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:ReceiverAccountNumber"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код IATA владельца топлива</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:SupplierOROwnerCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование владельца топлива</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:SupplierOROwnerName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="fftt:SupplierOROwnerLocalTaxID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН владельца топлива</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:SupplierOROwnerLocalTaxID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="fftt:SupplierOROwnerLocalTaxRegistrationReasonCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП владельца топлива</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:SupplierOROwnerLocalTaxRegistrationReasonCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа fftt:TransactionTimeType -->
	<xsl:template match="fftt:TransactionTime">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата начала заправки (локальное время)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:LocalDateTimeStart" mode="russian_date"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(fftt:LocalDateTimeStart, 12, 5)"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата окончания заправки (локальное время)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="fftt:LocalDateTimeFinished" mode="russian_date"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(fftt:LocalDateTimeFinished, 12, 5)"/>
					</td>
				</tr>
			</table>
			<xsl:if test="fftt:GMTDateTimeStart">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата начала заправки (глобальное время UTC)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:GMTDateTimeStart" mode="russian_date"/>
							<xsl:text> </xsl:text>
						<xsl:value-of select="substring(fftt:GMTDateTimeStart, 12, 5)"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="fftt:GMTDateTimeFinished">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата окончания заправки (глобальное время UTC)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="fftt:GMTDateTimeFinished" mode="russian_date"/>
							<xsl:text> </xsl:text>
						<xsl:value-of select="substring(fftt:GMTDateTimeFinished, 12, 5)"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
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
	<xsl:template match="//*[local-name()='FTSFuelTransactionTransmission']//*" priority="-1">
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
