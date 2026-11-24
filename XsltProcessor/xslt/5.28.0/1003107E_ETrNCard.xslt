<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:etnc="urn:customs.ru:Information:TransportDocuments:ETrNCard:5.28.0">
	<!-- Шаблон для типа ETrNCardType -->
	<xsl:template match="etnc:ETrNCard">
		<xsl:param name="w" select="297"/>
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
										<b>Ответ на запрос ЭПД - карточка ЭТрН</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор (УИД)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="etnc:GUID"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Номер транспортной накладной</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="etnc:ETrNNumber"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата транспортной накладной</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="etnc:ETrNDate" mode="russian_date"/>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Описание груза</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Наименование груза</td>
								<td class="graphMain bordered">Масса нетто груза в килограммах</td>
								<td class="graphMain bordered">Масса брутто груза в килограммах</td>
								<td class="graphMain bordered">Количество паллет</td>
								<td class="graphMain bordered">Габариты груза, в метрах</td>
								<td class="graphMain bordered">Сведения об опасном грузе</td>
								<td class="graphMain bordered">Сведения о контейнерах</td>
							</tr>
							<xsl:for-each select="etnc:Cargo">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="etnc:SpecialPermit">
						<div class="title marg-top">Специальное разрешение</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Номер специального разрешения</td>
									<td class="graphMain bordered">Дата специального разрешения</td>
									<td class="graphMain bordered">Срок действия специального разрешения</td>
									<td class="graphMain bordered">Идентификатор файла специального разрешения (в том числе регистрационный номер, если документ / сведения о таком документе содержатся в государственных информационных системах)</td>
									<td class="graphMain bordered">Маршрут, текстовый формат</td>
									<td class="graphMain bordered">Маршрут, машиночитаемый формат</td>
								</tr>
								<xsl:for-each select="etnc:SpecialPermit">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="etnc:AccompanyingDocuments">
						<div class="title marg-top">Сопроводительные документы</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Наименование документа</td>
									<td class="graphMain bordered">Номер документа</td>
									<td class="graphMain bordered">Дата документа</td>
								</tr>
								<xsl:for-each select="etnc:AccompanyingDocuments">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="etnc:Transporter">
						<div class="title marg-top">Перевозчик</div>
						<div>
							<xsl:apply-templates select="etnc:Transporter">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="etnc:Sender">
						<div class="title marg-top">Грузоотправитель</div>
						<div>
							<xsl:apply-templates select="etnc:Sender">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="etnc:Receiver">
						<div class="title marg-top">Грузополучатель</div>
						<div>
							<xsl:apply-templates select="etnc:Receiver">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="etnc:Address">
						<div class="title marg-top">Адрес места доставки груза</div>
						<div>
							<xsl:apply-templates select="etnc:Address">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<div class="title marg-top">Водитель</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Фамилия</td>
								<td class="graphMain bordered">Имя</td>
								<td class="graphMain bordered">Отчество</td>
								<td class="graphMain bordered">Должность</td>
								<td class="graphMain bordered">Перечень телефонов</td>
								<td class="graphMain bordered">Номер водительского удостоверения</td>
								<td class="graphMain bordered">Серия водительского удостоверения</td>
								<td class="graphMain bordered">Дата выдачи водительского удостоверения</td>
								<td class="graphMain bordered">ИНН физического лица</td>
								<td class="graphMain bordered">Сведения о способе идентификации при применении простой подписи</td>
								<td class="graphMain bordered">Путевой лист</td>
							</tr>
							<xsl:apply-templates select="etnc:Driver"/>
						</tbody>
					</table>
					<xsl:if test="etnc:Vehicle">
						<div class="title marg-top">Информация о транспортном средстве</div>
						<div>
							<xsl:apply-templates select="etnc:Vehicle">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="etnc:ModifiedTransportationInformation">
						<div class="title marg-top">Сведения, измененные в процессе перевозки </div>
						<div>
							<xsl:apply-templates select="etnc:ModifiedTransportationInformation">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа etnc:AccompanyingDocumentsType -->
	<xsl:template match="etnc:AccompanyingDocuments">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:DocumentName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:DocumentNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:DocumentDateIssue" mode="russian_date"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:AddressType -->
	<xsl:template match="etnc:Address">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="etnc:Coordinates">
				<div class="title marg-top">Координаты</div>
				<div>
					<xsl:apply-templates select="etnc:Coordinates">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="etnc:AddressRF">
				<div class="title marg-top">Реквизиты адреса на территории Российской Федерации</div>
				<div>
					<xsl:apply-templates select="etnc:AddressRF">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="etnc:AddressInf">
				<div class="title marg-top">Информация об адресе, в том числе об адресе за пределами территории Российской Федерации</div>
				<div>
					<xsl:apply-templates select="etnc:AddressInf">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный номер адреса объекта адресации в государственном адресном реестре</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:CodeGAR"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:AddressInfType -->
	<xsl:template match="etnc:AddressInf">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Ширина</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:CountryCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Долгота</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:AddressText"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:AddressRFType -->
	<xsl:template match="etnc:AddressRF">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:Postcode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код региона</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:RegionCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="etnc:District">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Район</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:District"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:Town">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Город</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:Town"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:Locality">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Населенный пункт</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:Locality"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:Street">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Улица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:Street"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:House">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дом</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:House"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:Building">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Корпус</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:Building"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:Apartment">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Квартира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:Apartment"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:CargoType -->
	<xsl:template match="etnc:Cargo">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:CargoName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:NetWeight" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:GrossWeight" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:NumberPallets"/>
				</td>
				<td class="graphMain bordered">
						<xsl:apply-templates select="etnc:CargoDimensions"/>
				</td>
				<td class="graphMain bordered">
						<xsl:apply-templates select="etnc:DangerousCargoInformation"/>
				</td>
				<td class="graphMain bordered">
						<xsl:apply-templates select="etnc:ContainerDetails"/>
				</td>
			</tr>
	</xsl:template>
	<!-- Шаблон для типа etnc:DimensionsType -->
	<xsl:template match="etnc:CargoDimensions">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"> x </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа etnc:ChangedAddressType -->
	<xsl:template match="etnc:ChangedAddress">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время переадресовки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:ForwardingDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			
			<div class="title marg-top">Основание переадресовки</div>
			<xsl:apply-templates select="etnc:ReassignmentBasis">
				<xsl:with-param name="wdth" select="$w"/>
			</xsl:apply-templates>
			<xsl:if test="etnc:Address">
				<div class="title marg-top">Адрес места выгрузки</div>
				<xsl:apply-templates select="etnc:Address">
					<xsl:with-param name="wdth" select="$w"/>
				</xsl:apply-templates>
			</xsl:if>
			<xsl:if test="etnc:Receiver">
				Новый грузополучатель
				<xsl:apply-templates select="etnc:Receiver">
					<xsl:with-param name="wdth" select="$w"/>
				</xsl:apply-templates>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:ChangedVehicleDriverType -->
	<xsl:template match="etnc:ChangedVehicleDriver">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время замены</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:DateTimeReplacement" mode="russian_date"/>
					</td>
				</tr>
			</table>
			
			<xsl:if test="etnc:Driver">
				<div class="title marg-top">Водитель</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Фамилия</td>
							<td class="graphMain bordered">Имя</td>
							<td class="graphMain bordered">Отчество</td>
							<td class="graphMain bordered">Должность</td>
							<td class="graphMain bordered">Перечень телефонов</td>
							<td class="graphMain bordered">Номер водительского удостоверения</td>
							<td class="graphMain bordered">Серия водительского удостоверения</td>
							<td class="graphMain bordered">Дата выдачи водительского удостоверения</td>
							<td class="graphMain bordered">ИНН физического лица</td>
							<td class="graphMain bordered">Сведения о способе идентификации при применении простой подписи</td>
							<td class="graphMain bordered">Путевой лист</td>
						</tr>
						<xsl:apply-templates select="etnc:Driver"/>
					</tbody>
				</table>
			</xsl:if>
			
			<xsl:if test="etnc:Vehicle">
				<xsl:apply-templates select="etnc:Vehicle">
					<xsl:with-param name="wdth" select="$w"/>
				</xsl:apply-templates>
			</xsl:if>

		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:ContainerDetailsType -->
	<xsl:template match="etnc:ContainerDetails">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="etnc:NumberContainers"/>
		<xsl:text>: </xsl:text>
		<xsl:for-each select="etnc:ContainerID">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа etnc:CoordinatesType -->
	<xsl:template match="etnc:Coordinates">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Ширина</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:Latitude"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Долгота</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:Longitude"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:DangerCargoType -->
	<xsl:template match="etnc:DangerousCargoInformation">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"> - </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа etnc:DriverType -->
	<xsl:template match="etnc:Driver">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PersonSurname"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PersonName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PersonPost"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="etnc:PhoneNumber">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:DriversLicenseNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:DriversLicenseSeries"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:DateIssue" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:INNPP"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:IdentificationSimpleSignature"/>
				</td>
				<td class="graphMain bordered">
						<xsl:apply-templates select="etnc:Waybill"/>
				</td>
			</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="etnc:FullName">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PersonSurname">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Фамилия</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonSurname"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Имя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonPost"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:IdentificationDocumentType -->
	<xsl:template match="etnc:IdentificationDocument">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Вид документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:DocumentType"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:DocumentNumber"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата выдачи документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:DateIssue" mode="russian_date"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:ModifiedTransportationInformationType -->
	<xsl:template match="etnc:ModifiedTransportationInformation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="etnc:ChangedAddress">
				<div class="title marg-top">Измененный адрес</div>

				<xsl:for-each select="etnc:ChangedAddress">
					<xsl:apply-templates select=".">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="etnc:ChangedVehicleDriver">
				<div class="title marg-top">Замененные транспортное средство или водители</div>

				<xsl:for-each select="etnc:ChangedVehicleDriver">
					<xsl:apply-templates select=".">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</xsl:for-each>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:PersonForeignType -->
	<xsl:template match="etnc:PersonForeign">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификация статуса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:StatusID"/>
					</td>
				</tr>
			</table>
			<xsl:if test="etnc:ForeignPersonID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор иностранного лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:ForeignPersonID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:CompanyName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование юридического лица полное /Фамилия, имя, отчество (при наличии) физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:CompanyName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:IdentificationDocument">
				<div class="title marg-top">Данные документа, удостоверяющего личность иностранного физического лица</div>
				<div>
					<xsl:apply-templates select="etnc:IdentificationDocument">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:PersonLPType -->
	<xsl:template match="etnc:PersonLP">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:INNLP"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование полное юридического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:CompanyName"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:PersonPPType -->
	<xsl:template match="etnc:PersonPP">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="etnc:INNPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН физического лица и индивидуального предпринимателя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:INNPP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:IsIndividualEntrepreneur">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак того, что физическое лицо является индивидуальным предпринимателем ("true" - является)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="etnc:IsIndividualEntrepreneur='true' or etnc:IsIndividualEntrepreneur='1'">
									<xsl:text>ДА</xsl:text>
								</xsl:when>
								<xsl:when test="etnc:IsIndividualEntrepreneur='false' or etnc:IsIndividualEntrepreneur='0'">
									<xsl:text>НЕТ</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="etnc:IsIndividualEntrepreneur"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:FullName">
				<div class="title marg-top">ФИО физического лица и индивидуального предпринимателя</div>
				<div>
					<xsl:apply-templates select="etnc:FullName">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:ReassignmentBasisType -->
	<xsl:template match="etnc:ReassignmentBasis">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="etnc:DocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:DocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:DocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:DocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:DocumentDateIssue">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:DocumentDateIssue" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:DocumentID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор файла документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:DocumentID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:ParticipantType -->
	<xsl:template match="etnc:Receiver">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="etnc:PersonPP">
				<div class="title marg-top">Сведения о ФЛ</div>
				<div>
					<xsl:apply-templates select="etnc:PersonPP">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="etnc:PersonLP">
				<div class="title marg-top">Сведения о ЮЛ</div>
				<div>
					<xsl:apply-templates select="etnc:PersonLP">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="etnc:PersonForeign">
				<div class="title marg-top">Сведения об иностранном лице</div>
				<div>
					<xsl:apply-templates select="etnc:PersonForeign">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:ParticipantType -->
	<xsl:template match="etnc:Sender">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="etnc:PersonPP">
				<div class="title marg-top">Сведения о ФЛ</div>
				<div>
					<xsl:apply-templates select="etnc:PersonPP">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="etnc:PersonLP">
				<div class="title marg-top">Сведения о ЮЛ</div>
				<div>
					<xsl:apply-templates select="etnc:PersonLP">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="etnc:PersonForeign">
				<div class="title marg-top">Сведения об иностранном лице</div>
				<div>
					<xsl:apply-templates select="etnc:PersonForeign">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:SpecialPermitType -->
	<xsl:template match="etnc:SpecialPermit">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:Number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:Date" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:Period"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:FileID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:RouteTextFormat"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:RouteMachineReadableFormat"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:VehicleDetailsType -->
	<xsl:template match="etnc:TrailerInformation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:STSNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:VINNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:VehicleRegistrationPlate"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:OwnershipType"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:Type"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:Brand"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:CarryingCapacityTon" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="etnc:CapacityCubicMeters" mode="translate_number"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:ParticipantType -->
	<xsl:template match="etnc:Transporter">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="etnc:PersonPP">
				<div class="title marg-top">Сведения о ФЛ</div>
				<div>
					<xsl:apply-templates select="etnc:PersonPP">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="etnc:PersonLP">
				<div class="title marg-top">Сведения о ЮЛ</div>
				<div>
					<xsl:apply-templates select="etnc:PersonLP">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="etnc:PersonForeign">
				<div class="title marg-top">Сведения об иностранном лице</div>
				<div>
					<xsl:apply-templates select="etnc:PersonForeign">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:VehicleType -->
	<xsl:template match="etnc:Vehicle">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="etnc:VehicleInformation">
				<div class="title marg-top">Данные о транспортном средстве</div>
				<div>
					<xsl:apply-templates select="etnc:VehicleInformation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="etnc:TrailerInformation">
				<div class="title marg-top">Данные о прицепе</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Номер СТС</td>
							<td class="graphMain bordered">VIN номер</td>
							<td class="graphMain bordered">Регистрационный номер</td>
							<td class="graphMain bordered">Тип владения</td>
							<td class="graphMain bordered">Тип</td>
							<td class="graphMain bordered">Марка</td>
							<td class="graphMain bordered">Грузоподъемность, в тоннах</td>
							<td class="graphMain bordered">Вместимость, в кубических метрах</td>
						</tr>
						<xsl:for-each select="etnc:TrailerInformation">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:VehicleDetailsType -->
	<xsl:template match="etnc:VehicleInformation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="etnc:STSNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер СТС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:STSNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:VINNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">VIN номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:VINNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:VehicleRegistrationPlate"/>
					</td>
				</tr>
			</table>
			<xsl:if test="etnc:OwnershipType">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Тип владения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:OwnershipType"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="etnc:Type">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Тип</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:Type"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Марка</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:Brand"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Грузоподъемность, в тоннах</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="etnc:CarryingCapacityTon" mode="translate_number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="etnc:CapacityCubicMeters">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Вместимость, в кубических метрах</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="etnc:CapacityCubicMeters" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа etnc:WaybillType -->
	<xsl:template match="etnc:Waybill">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"> - </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
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
	<xsl:template match="//*[local-name()='ETrNCard']//*" priority="-1">
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
