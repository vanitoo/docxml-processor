<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ap="urn:customs.ru:Information:CustomsDocuments:AirPreliminary:5.28.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:catpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonAggregateTypes:5.28.0" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.14.3">
	<!-- Шаблон для типа AirPreliminaryType -->
	<xsl:template match="ap:AirPreliminary">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
                  border: 1px solid gray;
                  }

                  .value
                  {
                  border-bottom: solid 1px gray;
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
                  border: solid 1px gray;
                  font-size: 8pt;
                  vertical-align:top;
                  }
                  
                  td.part {
					font-style: oblique;
					color: #333;
					text-decoration: underline;
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
							<tr class="title" align="center">
								<td class="bordered" colspan="4" style="text-decoration:underline">Предварительная информация о товарах, предполагаемых к ввозу на таможенную территорию Евразийского экономического союза воздушным транспортом</td>
							</tr>
							<xsl:if test="comment()">
								<xsl:variable name="PI_URN">
									<xsl:for-each select="comment()">
										<xsl:if test="substring(.,1,6) = 'PI_URN'">
											<xsl:value-of select="position()"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:variable>
								<xsl:if test="number($PI_URN) &gt; 0">
									<xsl:if test="substring(comment()[number($PI_URN)+1],1,6) = 'BitMap'">
										<tr>
											<td class="bordered" colspan="4" align="center">
												<xsl:variable name="bmpData" select="substring(comment()[number($PI_URN)+1],8)"/>
												<img>
													<xsl:attribute name="src"><xsl:value-of select="concat('data:image/bmp;base64,', $bmpData)"/></xsl:attribute>
												</img>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:if>
							<xsl:if test="ap:RegNumber">
								<tr>
									<td class="bordered" colspan="4">
										Регистрационный номер предварительной информации, содержащей обязательный состав сведений <br/>
										<xsl:apply-templates select="ap:RegNumber" mode="regnum"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ap:RefRegNumber">
								<tr>
									<td class="bordered" colspan="4">
										Регистрационный номер предварительной информации, в отношении которой осуществляется повторное представление предварительной информации <br/>
										<xsl:apply-templates select="ap:RefRegNumber" mode="regnum"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ap:UsageCode">
								<tr>
									<td class="bordered" colspan="4">
										Код цели представления предварительной информации <br/>
										<xsl:for-each select="ap:UsageCode">
											<xsl:if test="position() &gt; 1">, </xsl:if>
											<xsl:value-of select="."/>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ap:ArrivalDateTime">
								<tr>
									<td class="bordered" colspan="4">Планируемые (расчетные) дата и время прибытия<br/>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="ap:ArrivalDateTime"/>
										</xsl:call-template>
										<xsl:text> </xsl:text>
										<xsl:value-of select="substring(ap:ArrivalDateTime, 12, 8)"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ap:EntryCheckPointDetails">
								<tr class="title" align="center">
									<td class="bordered" colspan="4" style="background-color:#ccc;">Место прибытия товаров</td>
								</tr>
								<xsl:apply-templates select="ap:EntryCheckPointDetails"/>
							</xsl:if>
							<tr class="title" align="center">
								<td class="bordered" colspan="4" style="background-color:#ccc;">Лицо, представившее предварительную информацию</td>
							</tr>
							<xsl:apply-templates select="ap:DeclarantDetails" mode="org"/>
							<tr class="title" align="center">
								<td class="bordered" colspan="4" style="background-color:#ccc;">Сведения о транспортном средстве</td>
							</tr>
							<xsl:apply-templates select="ap:BorderTransportDetails"/>
							<xsl:apply-templates select="ap:ConsignmentDetails"/>
							<xsl:if test="ap:CarrierDetails">
								<tr class="title">
									<td class="bordered" colspan="4" style="background-color:#ccc;">Перевозчик, осуществляющий ввоз товаров на таможенную территорию Евразийского экономического союза</td>
								</tr>
								<xsl:apply-templates select="ap:CarrierDetails" mode="org"/>
							</xsl:if>
							<xsl:apply-templates select="ap:StoresInfo"/>
							<!--tr>
								<td class="bordered" style="background-color:#ddd;">
									Наличие лекарственных средств, в составе которых содержатся наркотические, сильнодействующие средства, психотропные и ядовитые вещества:<br/>
									<xsl:apply-templates select="ap:DrugsIndicator" mode="indicator"/>
								</td>
								<td class="bordered" style="background-color:#ddd;">
									Наличие товаров, ввоз которых на таможенную территорию Евразийского экономического союза запрещен и (или) ограничен:<br/>
									<xsl:apply-templates select="ap:DangerousGoodsIndicator" mode="indicator"/>
								</td>
								<td class="bordered" style="background-color:#ddd;">
									Наличие оружия или боеприпасов:<br/>
									<xsl:apply-templates select="ap:WeaponIndicator" mode="indicator"/>
								</td>
								<td class="bordered" style="background-color:#ddd;"></td>
							</tr>
							
							<xsl:apply-templates select="ap:SparePartsInfo"/-->
							<xsl:apply-templates select="ap:EpidemicControlDetails"/>
							<xsl:if test="ap:DiseasedPersonDetails">
								<tr class="title">
									<td class="bordered" colspan="4" style="background-color:#ccc;">Лицо, у которого выявлено заболевание или обнаружено подозрение на заболевание</td>
								</tr>
								<xsl:apply-templates select="ap:DiseasedPersonDetails"/>
							</xsl:if>
							<xsl:if test="ap:ControlledItemsDetails">
								<tr class="title">
									<td class="bordered" colspan="4" style="background-color:#ccc;">Сведения о припасах, запасных частях и оборудовании, подлежащие указанию при предоставлении</td>
								</tr>
								<xsl:apply-templates select="ap:ControlledItemsDetails"/>
							</xsl:if>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ap:ControlledItemsDetails">
		<tr>
			<td class="bordered">
				<xsl:choose>
					<xsl:when test="catpi_ru:InformationKindCode = 1">припасы</xsl:when>
					<xsl:when test="catpi_ru:InformationKindCode = 2">лекарственные средства, в составе которых содержатся наркотические, сильнодействующие средства, психотропные и ядовитые вещества</xsl:when>
					<xsl:when test="catpi_ru:InformationKindCode = 3">опасные товары (исключая оружие и (или) боеприпасы)</xsl:when>
					<xsl:when test="catpi_ru:InformationKindCode = 4">запасные части и оборудование</xsl:when>
					<xsl:when test="catpi_ru:InformationKindCode = 5">оружие и (или) боеприпасы</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="catpi_ru:InformationKindCode"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="bordered">
				<xsl:choose>
					<xsl:when test="catpi_ru:PresenceIndicator=1 or catpi_ru:PresenceIndicator='true'">есть</xsl:when>
					<xsl:otherwise>нет</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="bordered" colspan="2">
				<xsl:for-each select="catpi_ru:ItemDetails">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="catpi_ru:GoodsDescription"/>
					<xsl:text> </xsl:text>
					<xsl:apply-templates mode="quantity" select="catpi_ru:Quantity"/>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="ap:DiseasedPersonDetails">
		<tr>
			<td class="bordered">
				<xsl:apply-templates select="ap:Person" mode="spaced"/>
			</td>
			<td class="bordered">
				<xsl:choose>
					<xsl:when test="ap:RoleCode=1">член экипажа</xsl:when>
					<xsl:when test="ap:RoleCode=2">пассажир</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="ap:RoleCode"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="bordered" colspan="2">
				<xsl:value-of select="ap:DiseaseDescription"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="ap:EpidemicControlDetails">
		<tr class="title">
			<td class="bordered" colspan="4" style="background-color:#ccc;">Санитарно-эпидемиологический надзор</td>
		</tr>
		<tr>
			<td class="bordered">Наличие больного лица или лица с подозрением на заболевание на борту</td>
			<td class="bordered" colspan="3">
				<xsl:apply-templates select="ap:DiseasedPerson" mode="indicator"/>
			</td>
		</tr>
		<xsl:if test="ap:DiseasedPersonQuantity">
			<tr>
				<td class="bordered">Число заболевших и лиц с подозрением на заболевание</td>
				<td class="bordered" colspan="3">
					<xsl:apply-templates select="ap:DiseasedPersonQuantity"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:apply-templates select="ap:PestControlDetails"/>
	</xsl:template>
	<xsl:template match="ap:PestControlDetails">
		<tr>
			<td class="bordered">Проведение дезинсекции</td>
			<td class="bordered" colspan="3">
				<xsl:apply-templates select="ap:DisinfestationIndicator" mode="indicator"/>
			</td>
		</tr>
		<xsl:if test="ap:DisinfestationDetails">
			<tr>
				<td class="bordered" colspan="4">Детали проведения дезинсекции</td>
			</tr>
			<tr>
				<td class="bordered">Код</td>
				<td class="bordered">Описание</td>
				<td class="bordered">Дата</td>
				<td class="bordered">Субстанция</td>
			</tr>
			<xsl:for-each select="ap:DisinfestationDetails">
				<tr>
					<td class="bordered">
						<xsl:value-of select="ap:DisinfestationCode"/>
					</td>
					<td class="bordered">
						<xsl:value-of select="ap:DisinfestationMethod"/>
					</td>
					<td class="bordered">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ap:DisinfestationDate"/>
						</xsl:call-template>
					</td>
					<td class="bordered">
						<xsl:value-of select="ap:ChemicalName"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ap:SparePartsInfo">
		<tr class="title">
			<td class="bordered" colspan="4" style="background-color:#ccc;">Запчасти или оборудование для ремонта</td>
		</tr>
		<tr>
			<td class="bordered">Наличие запасных частей</td>
			<td class="bordered" colspan="3">
				<xsl:apply-templates select="catpi_ru:StoreIndicator" mode="indicator"/>
			</td>
		</tr>
		<xsl:if test="catpi_ru:StoreItemDetails">
			<tr>
				<td class="bordered" colspan="4">Наименование и количиество запчастей</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:StoreItemDetails/catpi_ru:SparePartsItemDetails"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="catpi_ru:SparePartsItemDetails">
		<tr>
			<td class="bordered" colspan="2">
				<xsl:apply-templates select="catpi_ru:GoodsDescription"/>
			</td>
			<td class="bordered" colspan="2">
				<xsl:apply-templates select="catpi_ru:Quantity" mode="quantity"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="ap:StoresInfo">
		<tr class="title">
			<td class="bordered" colspan="4" style="background-color:#ccc;">Припасы</td>
		</tr>
		<tr>
			<td class="bordered">Наличие припасов на борту ТС</td>
			<td class="bordered" colspan="3">
				<xsl:apply-templates select="catpi_ru:StoreIndicator" mode="indicator"/>
			</td>
		</tr>
		<xsl:if test="catpi_ru:StoreItemDetails">
			<tr>
				<td class="bordered" colspan="4">Наименование и количиество припасов</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:StoreItemDetails"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="catpi_ru:StoreItemDetails">
		<tr>
			<td class="bordered" colspan="2">
				<xsl:apply-templates select="catpi_ru:GoodsDescription"/>
			</td>
			<td class="bordered" colspan="2">
				<xsl:apply-templates select="catpi_ru:Quantity" mode="quantity"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="ap:ConsignmentDetails">
		<tr class="title" align="center">
			<td class="bordered" colspan="4" style="font-style: oblique; background-color: #999">Сведения о товарной партии № <xsl:value-of select="ap:ObjectOrdinal"/></td>
		</tr>
		<tr>
			<td class="bordered">
				Код цели предоставления:<br/>
				<xsl:for-each select="ap:UsageCode">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Транспортный документ:<br/>
				<xsl:apply-templates select="ap:TransportDocumentDetails" mode="doc"/>
			</td>
			<td class="bordered">
				Рег.номер ТД<br/>
				<xsl:apply-templates select="ap:CustomsDocIdDetails" mode="regnum"/>
			</td>
			<td class="bordered">
				Код типа ТД<br/>
				<xsl:value-of select="ap:CustomsProcedure"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код особенности перевозки<br/>
				<xsl:value-of select="ap:TransitDirectionCode"/>
			</td>
			<td class="bordered">
				Особенность помещения под процедуру<br/>
				<xsl:value-of select="ap:TransitFeature"/>
			</td>
			<td class="bordered">
				Код особенности декларирования<br/>
				<xsl:value-of select="ap:DeclarationFeatureCode"/>
				<!--Кол-во отгрузочных спецификаций<br/>
				<xsl:value-of select="ap:SpecificationNumber"/ удален-->
			</td>
			<td class="bordered">
				Код исп. трансп. (перевоз.), коммерч. и (или) иных док-тов в качестве ТД<br/>
				<xsl:value-of select="ap:DocUsageCode"/>
				<!--Кол-во листов отгр.спецификаций<br/>
				<xsl:value-of select="ap:SpecificationListNumber"/ удален-->
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Общее кол-во товаров<br/>
				<xsl:value-of select="ap:TotalGoodsNumber"/>
			</td>
			<td class="bordered">
				Общее кол-во грузовых мест<br/>
				<xsl:value-of select="ap:TotalPackageNumber"/>
			</td>
			<td class="bordered">
				Страна отправления<br/>
				<xsl:apply-templates select="ap:DispatchCountryCode"/>
			</td>
			<td class="bordered">
				Страна назначения<br/>
				<xsl:apply-templates select="ap:DestinationCountryCode"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Общая стоимость товаров<br/>
				<xsl:apply-templates select="ap:TotalAmount" mode="spaced"/>
			</td>
			<td class="bordered">
				Общий вес брутто товаров в товарной партии<br/>
				<xsl:value-of select="ap:GrossWeightQuantity"/>
			</td>
			<td class="bordered">
				Международный почтовый код<br/>
				<xsl:value-of select="ap:InternationalMailCode"/>
			</td>
			<td class="bordered">
				Общее количество листов в документе<br/>
				<xsl:value-of select="ap:PageQuantity"/>
			</td>
		</tr>
		<xsl:if test="ap:ConsignorDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;background-color:#ccc;">Отправитель</td>
			</tr>
			<xsl:apply-templates select="ap:ConsignorDetails" mode="org"/>
		</xsl:if>
		<xsl:if test="ap:ConsigneeDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;background-color:#ccc;">Получатель</td>
			</tr>
			<xsl:apply-templates select="ap:ConsigneeDetails" mode="org"/>
		</xsl:if>
		<tr>
			<td class="bordered" colspan="2">
				Аэропорт погрузки: 
				<xsl:apply-templates select="ap:LoadingLocationDetails" mode="comma"/>
			</td>
			<td class="bordered" colspan="2">
				Аэропорт выгрузки: 
				<xsl:apply-templates select="ap:UnLoadingLocationDetails" mode="comma"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="4">
				ТО назначения: 
				<xsl:value-of select="ap:DestinationCustomsOfficeCode"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="4">
				Сведения о контейнере: 
				<xsl:for-each select="ap:ContainerDetails">
					<xsl:if test="position() &gt; 1">; </xsl:if>
					<xsl:apply-templates select="." mode="spaced"/>
				</xsl:for-each>
			</td>
		</tr>
		<xsl:if test="ap:CustomsIdentificationDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;background-color:#ccc;">Сведения о средствах идентификации</td>
			</tr>
			<xsl:apply-templates select="ap:CustomsIdentificationDetails"/>
		</xsl:if>
		<xsl:if test="ap:PITransitTransportMeansDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;background-color:#ccc;">Сведения о транспортных средствах</td>
			</tr>
			<xsl:apply-templates select="ap:PITransitTransportMeansDetails"/>
		</xsl:if>
		<xsl:if test="ap:TransitTerminationDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style:oblique;background-color:#ccc;">
					Сведения о предполагаемом ТО и пункте назначения
				</td>
			</tr>
			<xsl:apply-templates select="ap:TransitTerminationDetails"/>
		</xsl:if>
		<xsl:apply-templates select="ap:PITranshipmentDetails"/>
		<xsl:if test="ap:UnloadWarehouseDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style:oblique;background-color:#ccc;">Сведения о планируемом месте временного хранения</td>
			</tr>
			<xsl:apply-templates select="ap:UnloadWarehouseDetails"/>
		</xsl:if>
		<xsl:apply-templates select="ap:GoodsItem"/>
		<xsl:apply-templates select="ap:TransitGuaranteeDetails"/>
		<xsl:if test="ap:TransitDeclarantDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style:oblique;background-color:#ccc;">Декларант таможенной процедуры таможенного транзита</td>
			</tr>
			<xsl:apply-templates select="ap:TransitDeclarantDetails" mode="org"/>
		</xsl:if>
		<xsl:if test="ap:UnionCarrierDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style:oblique;background-color:#ccc;">Перевозчик товаров по таможенной территории Евразийского экономического союза</td>
			</tr>
			<xsl:for-each select="ap:UnionCarrierDetails">
				<tr>
					<td class="bordered" colspan="2">
						Порядковый номер: 
						<xsl:value-of select="catpi_ru:CarrierOrdinal"/>
					</td>
					<td class="bordered" colspan="2">
						Ссылочный порядковый номер: 
						<xsl:value-of select="catpi_ru:ReferenceCarrierOrdinal"/>
					</td>
				</tr>
				<xsl:apply-templates select="." mode="org"/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="ap:SignatoryRepresentativeDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style:oblique;background-color:#ccc;">Таможенный представитель, заполнивший (подписавший) таможенный документ</td>
			</tr>
			<tr>
				<td class="bordered part" colspan="2" style="font-weight:bold;font-family: Arial;font-size: 9pt;">
					Сведения о включении лица в реестр таможенных представителей
				</td>
				<td class="bordered" colspan="2">
					Код вида док-та: 
					<xsl:value-of select="ap:SignatoryRepresentativeDetails/catpi_ru:RegisterDocumentIdDetails/catpi_ru:DocKindCode"/>
				</td>
			</tr>
			<xsl:apply-templates select="ap:SignatoryRepresentativeDetails/catpi_ru:RegisterDocumentIdDetails" mode="certif"/>
			<tr class="title">
				<td class="bordered part" colspan="4">
					Договор таможенного представителя с декларантом (заявителем)
				</td>
			</tr>
			<tr>
				<td class="bordered">
					Реквизиты: 
					<xsl:apply-templates select="ap:SignatoryRepresentativeDetails/catpi_ru:RepresentativeContractDetails" mode="doc"/>
				</td>
				<td class="bordered">
					Дата начала срока, в течение которого док-т имеет силу: 
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ap:SignatoryRepresentativeDetails/catpi_ru:RepresentativeContractDetails/RUScat_ru:DocStartDate"/></xsl:call-template>
				</td>
				<td class="bordered">
					Дата окончания срока, в течение которого док-т имеет силу: 
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ap:SignatoryRepresentativeDetails/catpi_ru:RepresentativeContractDetails/RUScat_ru:DocValidityDate"/></xsl:call-template>
				</td>
				<td class="bordered">
					Код вида док-та: 
					<xsl:value-of select="ap:SignatoryRepresentativeDetails/catpi_ru:RepresentativeContractDetails/RUScat_ru:DocKindCode"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:apply-templates select="ap:SignatoryPersonDetails"/>
	</xsl:template>
	<xsl:template match="ap:SignatoryPersonDetails">
		<tr class="title">
			<td class="bordered" colspan="4" style="font-style:oblique;background-color:#ccc;">Работник таможенного представителя</td>
		</tr>
		<tr>
			<td class="bordered" colspan="2">
				ФИО: 
				<xsl:value-of select="RUDECLcat:SigningDetails/cat_ru:PersonSurname"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="RUDECLcat:SigningDetails/cat_ru:PersonName"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="RUDECLcat:SigningDetails/cat_ru:PersonMiddleName"/>
			</td>
			<td class="bordered">
				Должность: 
				<xsl:value-of select="RUDECLcat:SigningDetails/cat_ru:PersonPost"/>
			</td>
			<td class="bordered">
				Дата подписания: 
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="RUDECLcat:SigningDetails/RUScat_ru:SigningDate"/></xsl:call-template>
			</td>
		</tr>
		
		<xsl:if test="RUDECLcat:SigningDetails/RUScat_ru:CommunicationDetails">
			<tr class="title">
				<td class="bordered part" colspan="4">Контакты</td>
			</tr>
			<xsl:apply-templates select="RUDECLcat:SigningDetails/RUScat_ru:CommunicationDetails" mode="contacts"/>
		</xsl:if>
		
		<xsl:if test="RUDECLcat:SignatoryPersonIdentityDetails">
			<tr class="title">
				<td class="bordered part" colspan="4">Сведения о док-те, удостоверяющем личность лица, заполнившего (подписавшего) док-т</td>
			</tr>
			<xsl:apply-templates select="RUDECLcat:SignatoryPersonIdentityDetails" mode="identityCard"/>
		</xsl:if>
		
		<tr>
			<td class="bordered" colspan="2">
				Номер кваллификационного аттестата специалиста по таможенному оформлению
			</td>
			<td class="bordered" colspan="2">
				<xsl:value-of select="RUDECLcat:QualificationCertificate"/>
			</td>
		</tr>
		<tr class="title">
			<td class="bordered part" colspan="4">
				Документ, удостоверяющий полномочия
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Реквизиты: 
				<xsl:apply-templates select="RUDECLcat:PowerOfAttorneyDetails" mode="doc"/>
			</td>
			<td class="bordered">
				Дата начала срока, в течение которого док-т имеет силу: 
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="RUDECLcat:PowerOfAttorneyDetails/RUScat_ru:DocStartDate"/></xsl:call-template>
			</td>
			<td class="bordered">
				Дата окончания срока, в течение которого док-т имеет силу: 
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="RUDECLcat:PowerOfAttorneyDetails/RUScat_ru:DocValidityDate"/></xsl:call-template>
			</td>
			<td class="bordered">
				Код вида док-та: 
				<xsl:value-of select="RUDECLcat:PowerOfAttorneyDetails/RUScat_ru:DocKindCode"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="catpi_ru:TransitGuaranteeDocDetails">
		<tr>
			<td class="bordered">
				Код вида документа:<br/>
				<xsl:value-of select="catpi_ru:DocKindCode"/>
			</td>
			<td class="bordered">
				Наименование документа:<br/>
				<xsl:value-of select="catpi_ru:DocName"/>
			</td>
			<td class="bordered">
				Сведения о рег.номере сертификата обеспечения<br/>
				<xsl:apply-templates select="catpi_ru:GuaranteeCertificateIdDetails" mode="regnum"/>
			</td>
			<td class="bordered">
				Там. док-т, подтверждающий принятие обеспечения:<br/>
				<xsl:apply-templates select="catpi_ru:GuaranteeCustomsDocIdDetails" mode="regnum"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Номер иного док-та:<br/>
				<xsl:value-of select="catpi_ru:DocId"/>
			</td>
			<td class="bordered">
				Дата выдачи, подписания, утверждения или регистрации док-та:<br/>
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="catpi_ru:DocCreationDate"/></xsl:call-template>
			</td>
			<td class="bordered">
				Сумма (размер) предоставленного обеспечения:<br/>
				<xsl:apply-templates select="catpi_ru:GuaranteeAmount" mode="spaced"/>
			</td>
			<td class="bordered">
				Код способа обеспечения:<br/>
				<xsl:apply-templates select="catpi_ru:PaymentGuaranteeMethodCode"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="2">
				Порядковые номера товаров, в отношении которых используется генеральное обеспечение:<br/>
				<xsl:for-each select="catpi_ru:ReferenceConsignmentItemOrdinal">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered" colspan="2">
				Диапазоны порядковых номеров товаров, в отношении которых используется генеральное обеспечение:<br/>
				<xsl:for-each select="catpi_ru:ReferenceConsignmentItemRangeDetails">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="catpi_ru:FirstReferenceOrdinal"/>-<xsl:value-of select="catpi_ru:LastReferenceOrdinal"/>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="ap:TransitGuaranteeDetails">
		<tr class="title">
			<td class="bordered" colspan="4" style="font-style:oblique;background-color:#ccc;">Сведения о мере обеспечения соблюдения таможенного транзита</td>
		</tr>
		<tr>
			<td class="bordered" colspan="2">
				Код предоставления<br/>
				<xsl:apply-templates select="catpi_ru:GuaranteePresentCode" mode="indicator"/>
				<!--Код меры обеспечения<br/>
				<xsl:value-of select="catpi_ru:MeasureCode"/ удален-->
			</td>
			<td class="bordered" colspan="2">
				Код основания для непредоставления<br/>
				<xsl:apply-templates select="catpi_ru:NoGuaranteeCauseCode" mode="indicator"/>
				<!--Сумма обеспечения (для РБ)<br/>
				<xsl:apply-templates select="catpi_ru:GuaranteeAmount" mode="spaced"/ удален-->
			</td>
			<!--td class="bordered">
				Сведения о рег.номере сертификата обеспечения<br/>
				<xsl:apply-templates select="catpi_ru:GuaranteeCertificateIdDetails" mode="regnum"/>
			</td удален-->
		</tr>
		<tr>
			<td class="bordered" colspan="4">
				Документ, подтверждающий предоставление (принятие) либо основание для непредоставления<br/>
				<xsl:apply-templates select="catpi_ru:TransitGuaranteeDocDetails"/>
			</td>
		</tr>
		<!--tr>
			<td class="bordered">
				Код вида гарантии<br/>
				<xsl:value-of select="catpi_ru:NationalGuaranteeCode"/>
			</td>
			<td class="bordered">
				Код страны<br/>
				<xsl:for-each select="catpi_ru:NonGuaranteeCountryCode">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Документ о включении в реестр<br/>
				<xsl:apply-templates select="catpi_ru:RegisterDocumentIdDetails" mode="comma"/>
			</td>
			<td class="bordered">
				Наименование гаранта<br/>
				<xsl:value-of select="catpi_ru:GuaranteeName"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				УНП<br/>
				<xsl:value-of select="catpi_ru:UNP"/>
			</td>
			<td class="bordered">
				Код МФО/БИК<br/>
				<xsl:value-of select="catpi_ru:BIC"/>
			</td>
			<td class="bordered">
				Поручительство<br/>
				<xsl:apply-templates select="catpi_ru:GuaranteeTD" mode="doc"/>
			</td>
			<td class="bordered">
				Адрес гаранта:<br/>
				<xsl:apply-templates select="catpi_ru:GuaranteeAddress" mode="comma"/>
			</td>
		</tr удалены-->
	</xsl:template>
	<xsl:template match="ap:GoodsItem">
		<tr class="title">
			<td class="bordered" colspan="4" style="font-style:oblique;background-color:#ccc;">Сведения о товаре <xsl:value-of select="catpi_ru:GoodsNumeric"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код ТН ВЭД<br/>
				<xsl:value-of select="catpi_ru:GoodsTNVEDCode"/>
			</td>
			<td class="bordered">
				Описание:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsDescription"/>
			</td>
			<td class="bordered">
				Вес брутто (кг)<br/>
				<xsl:value-of select="catpi_ru:GrossWeightQuantity"/>
			</td>
			<td class="bordered">
				Вес нетто (кг)<br/>
				<xsl:value-of select="catpi_ru:NetWeightQuantity"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Кол-во в ДЕИ:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsMeasureQuantity" mode="quantity"/>
			</td>
			<td class="bordered">
				Номер товара в ТД:<br/>
				<xsl:for-each select="catpi_ru:DTConsignmentItemOrdinal">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Признак товара, свободного от применения запретов и ограничений:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsProhibitionFreeCode" mode="indicator"/>
				<!--Признак продукции военного назначения:<br/>
				<xsl:apply-templates select="catpi_ru:MilitaryProducts" mode="indicator"/ удален-->
			</td>
			<td class="bordered">
				Кол-во товара в ЕИ, отличной от основной и ДЕИ:<br/>
				<!--xsl:for-each select="catpi_ru:AddGoodsMeasureQuantity">
					<xsl:if test="position() &gt; 1">, </xsl:if-->
					<xsl:apply-templates select="catpi_ru:AddGoodsMeasureQuantity" mode="quantity"/>
				<!--/xsl:for-each убрана множественность-->
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Места происхождения:<br/>
				<xsl:for-each select="catpi_ru:ProductionPlaceName">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Описание маркировки:<br/>
				<xsl:value-of select="catpi_ru:GoodsLabelDescription"/>
			</td>
			<td class="bordered">
				Назначение области применения:<br/>
				<xsl:value-of select="catpi_ru:GoodsUsageDescription"/>
			</td>
			<td class="bordered">
				Признак декларирования компонентов разобранного товара, перевозимых по территориям нескольких государств-членов:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsComponentCode" mode="indicator"/>
			</td>
		</tr>
		<xsl:for-each select="catpi_ru:Manufacturer">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;">Производитель</td>
			</tr>
			<xsl:apply-templates select="." mode="org"/>
		</xsl:for-each>
		<xsl:if test="catpi_ru:VetReleaseOrganizationDetails">
			<tr>
				<td class="bordered">Сведения о предприятии, выпустившем в оборот товары, подлежащие ветеринарному контролю</td>
				<td class="bordered" colspan="3">
					<xsl:for-each select="catpi_ru:VetReleaseOrganizationDetails">
						<xsl:if test="position() &gt; 1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="." mode="comma"/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="catpi_ru:CargoPackagePalletDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;">Сведения о грузе, грузовых местах, поддонах и упаковке товаров</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:CargoPackagePalletDetails"/>
		</xsl:if>
		<tr>
			<td class="bordered">
				Номера контейнеров:<br/>
				<xsl:for-each select="catpi_ru:PIContainerDetails">
					<xsl:if test="position() &gt; 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="spaced"/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Страна происхождения:<br/>
				<xsl:apply-templates select="catpi_ru:OriginCountryDetails" mode="comma"/>
			</td>
			<td class="bordered">
				Стоимость (цена)<br/>
				<xsl:apply-templates select="catpi_ru:CAValueAmount" mode="spaced"/>
			</td>
			<td class="bordered">
				Предшествующий документ:<br/>
				<xsl:for-each select="catpi_ru:PIPrecedingDocDetails">
					<xsl:if test="position() &gt; 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
		</tr>
		<xsl:if test="catpi_ru:PIGoodsDocDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;">Доп. информация</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:PIGoodsDocDetails"/>
		</xsl:if>
		<xsl:if test="catpi_ru:PIShipmentLocationDetails">
			<tr>
				<td class="bordered">Сведения о месте и дате отгрузки товара</td>
				<td class="bordered" colspan="3">
					<xsl:apply-templates select="catpi_ru:PIShipmentLocationDetails" mode="comma"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<xsl:template match="catpi_ru:PIGoodsDocDetails">
		<tr>
			<td class="bordered" style="background-color: #ddd;">
				Документ:<br/>
				<xsl:apply-templates select="." mode="doc"/>
				<xsl:if test="catpi_ru:DocumentPresentingDetails/catpi_ru:DocPresentKindCode">
					<br/>фактически представлен - <xsl:apply-templates select="catpi_ru:DocumentPresentingDetails/catpi_ru:DocPresentKindCode" mode="indicator_yn"/>
				</xsl:if>
			</td>
			<td class="bordered">
				Действует с:<br/>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="RUScat_ru:DocStartDate"/>
				</xsl:call-template>
			</td>
			<td class="bordered">
				Действует по:<br/>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="RUScat_ru:DocValidityDate"/>
				</xsl:call-template>
			</td>
			<td class="bordered">
				Код страны<br/>
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код вида док-та<br/>
				<xsl:value-of select="catpi_ru:DocKindCode"/>
			</td>
			<td class="bordered">
				Орган гос.власти:<br/>
				<xsl:value-of select="catpi_ru:AuthorityName"/>
			</td>
			<td class="bordered">
				ИД органа:<br/>
				<xsl:value-of select="catpi_ru:AuthorityId"/>
			</td>
			<td class="bordered">
				Типографский № бланка:<br/>
				<xsl:value-of select="catpi_ru:FormNumberId"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Учетная серия корма:<br/>
				<xsl:value-of select="catpi_ru:RegistrationSeriesId"/>
			</td>
			<td class="bordered">
				Код товара по ТН ВЭД:<br/>
				<xsl:value-of select="catpi_ru:TnvedCode"/>
			</td>
			<td class="bordered">
				Торг. наименование:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsDescription"/>
			</td>
			<td class="bordered">
				Описание маркировки:<br/>
				<xsl:value-of select="catpi_ru:GoodsLabelDescription"/>
			</td>
		</tr>
		<xsl:if test="catpi_ru:GoodsDisinfectionDetails">
			<tr>
				<td class="bordered" colspan="4" style="font-style: oblique;">Обеззараживание</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:GoodsDisinfectionDetails"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="catpi_ru:GoodsDisinfectionDetails">
		<tr>
			<td class="bordered" colspan="4">
				Проведено:<br/>
				<xsl:apply-templates select="catpi_ru:DisinfectionIndicator" mode="indicator"/>
			</td>
		</tr>
		<xsl:apply-templates select="catpi_ru:DisinfectionDetails"/>
	</xsl:template>
	<xsl:template match="catpi_ru:DisinfectionDetails">
		<tr>
			<td class="bordered">
				Дата проведения:<br/>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="catpi_ru:EventDate"/>
				</xsl:call-template>
			</td>
			<td class="bordered">
				Продолжительность:<br/>
				<xsl:value-of select="catpi_ru:ExpositionDuration"/>
			</td>
			<td class="bordered">
				Способ обработки:<br/>
				<xsl:value-of select="catpi_ru:DisinfectionMethodName"/>
			</td>
			<td class="bordered">
				Химикат:<br/>
				<xsl:value-of select="catpi_ru:ChemicalName"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Температура:<br/>
				<xsl:value-of select="catpi_ru:TemperatureMeasure"/>
			</td>
			<td class="bordered">
				Концентрация:<br/>
				<xsl:apply-templates select="catpi_ru:ConcentrationMeasure" mode="quantity"/>
			</td>
			<td class="bordered">
				Доза:<br/>
				<xsl:apply-templates select="catpi_ru:DoseMeasure" mode="quantity"/>
			</td>
			<td class="bordered">
				Доп.информация:<br/>
				<xsl:value-of select="catpi_ru:DescriptionText"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="catpi_ru:CargoPackagePalletDetails">
		<tr>
			<td class="bordered">
				Общее кол-во грузовых мест<br/>
				<xsl:value-of select="catpi_ru:PakageQuantity"/>
			</td>
			<td class="bordered">
				Код наличия упаковки<br/>
				<xsl:value-of select="catpi_ru:PakageTypeCode"/>
			</td>
			<td class="bordered">
				Кол-во частично занятых гр.мест<br/>
				<xsl:value-of select="catpi_ru:PakagePartQuantity"/>
			</td>
			<td class="bordered">
				Вид грузовых мест<br/>
				<xsl:value-of select="catpi_ru:PakageKindName"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="2">
				Описание маркировки груза
			</td>
			<td class="bordered" colspan="2">
				<xsl:apply-templates select="catpi_ru:CargoLabelDescriptionText"/>
			</td>
		</tr>
		<xsl:if test="catpi_ru:PackagePalleteInformation">
			<tr>
				<td class="bordered" colspan="4" style="font-style: oblique;">Сведения о грузе, таре, упаковке, поддоне</td>
			</tr>
			<tr>
				<td class="bordered">Код информации</td>
				<td class="bordered">Код вида</td>
				<td class="bordered">Кол-во</td>
				<td class="bordered">Описание</td>
			</tr>
			<xsl:for-each select="catpi_ru:PackagePalleteInformation">
				<tr>
					<td class="bordered">
						<xsl:value-of select="catpi_ru:InfoKindCode"/>
					</td>
					<td class="bordered">
						<xsl:value-of select="catpi_ru:PalleteCode"/>
					</td>
					<td class="bordered">
						<xsl:value-of select="catpi_ru:PalleteQuantity"/>
					</td>
					<td class="bordered">
						<xsl:apply-templates select="catpi_ru:CargoDescriptionText"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="quantity">
		<xsl:value-of select="*[local-name() = 'GoodsQuantity']|*[local-name() = 'MeasuredAmount']"/>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierName']">
			<xsl:text> </xsl:text>
			<xsl:value-of select="*[local-name() = 'MeasureUnitQualifierName']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ap:UnloadWarehouseDetails">
		<tr>
			<td class="bordered">
				Код<br/>
				<xsl:value-of select="catpi_ru:InformationTypeCode"/>
			</td>
			<td class="bordered">
				Наименование<br/>
				<xsl:value-of select="catpi_ru:PlaceName"/>
			</td>
			<td class="bordered">
				Дата<br/>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="catpi_ru:WarehouseDate"/>
				</xsl:call-template>
			</td>
			<td class="bordered">
				Особые условия<br/>
				<xsl:apply-templates select="catpi_ru:StorageRequirementDetails"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="2">
				Документ:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsLocationDocDetails" mode="doc"/>
				<xsl:text>, действителен с </xsl:text>
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="catpi_ru:GoodsLocationDocDetails/RUScat_ru:DocStartDate"/></xsl:call-template>
				<xsl:text> по </xsl:text>
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="catpi_ru:GoodsLocationDocDetails/RUScat_ru:DocValidityDate"/></xsl:call-template>
			</td>
			<td class="bordered" colspan="2">
				Доп.сведения о документе:<br/>
				<xsl:apply-templates select="catpi_ru:RegisterDocumentIdDetails" mode="comma"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="catpi_ru:StorageRequirementDetails">
		<xsl:apply-templates select="catpi_ru:SpecialStorageRequirementIndicator" mode="indicator"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="catpi_ru:Description"/>
	</xsl:template>
	<xsl:template match="ap:PITranshipmentDetails">
		<tr class="title">
			<td class="bordered" colspan="4" style="font-style: oblique; background-color:#ccc;">
				Планируемая грузовая операция <xsl:value-of select="position()"/><xsl:if test="catpi_ru:CarrierOrdinal"> (продолжает перевозчик №<xsl:value-of select="catpi_ru:CarrierOrdinal"/>)</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код вида<br/>
				<xsl:value-of select="catpi_ru:CargoOperationKindCode"/>
			</td>
			<td class="bordered">
				Признак перегрузки товаров:<br/>
				<xsl:apply-templates select="catpi_ru:ContainerIndicator" mode="indicator"/>
			</td>
			<td class="bordered">
				Код страны: <br/>
				<xsl:value-of select="catpi_ru:CountryCode"/>
			</td>
			<td class="bordered">
				Страна<br/>
				<xsl:value-of select="catpi_ru:CountryName"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Место:<br/>
				<xsl:value-of select="catpi_ru:PlaceName"/>
			</td>
			<td class="bordered">
				ТО<br/>
				<xsl:value-of select="catpi_ru:CustomsOfficeCode"/>
			</td>
			<td class="bordered">
				Код ж/д станции<br/>
				<xsl:value-of select="catpi_ru:RailwayStationCode"/>
				<!--№ нового контейнера:<br/>
				<xsl:for-each select="catpi_ru:ContainerNumber">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each удален-->
			</td>
			<td class="bordered">
				Описание:<br/>
				<xsl:value-of select="catpi_ru:Description"/>
			</td>
		</tr>
		<xsl:if test="catpi_ru:TranshipmentTransportMeansDetails">
			<tr>
				<td class="bordered" colspan="4">Сведения о ТС при совершении грузовой операции</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:TranshipmentTransportMeansDetails"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="catpi_ru:TranshipmentTransportDetails | catpi_ru:TranshipmentTransportMeansDetails">
		<tr>
			<td class="bordered">
				Номер п/п<br/>
				<xsl:value-of select="catpi_ru:ObjectOrdinal"/>
			</td>
			<td class="bordered">
				Код вида<br/>
				<xsl:value-of select="catpi_ru:TransportTypeCode"/>
			</td>
			<td class="bordered">
				Код страны<br/>
				<xsl:value-of select="catpi_ru:RegistrationNationalityCode"/>
			</td>
			<td class="bordered">
				ID:<br/>
				<xsl:value-of select="catpi_ru:TransportMeansRegId"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				VIN<br/>
				<xsl:value-of select="catpi_ru:VehicleId"/>
			</td>
			<td class="bordered">
				Код типа<br/>
				<xsl:value-of select="catpi_ru:VehicleMarkCode"/>
			</td>
			<td class="bordered">
				Код марки<br/>
				<xsl:value-of select="catpi_ru:VehicleModelName"/>
			</td>
			<td class="bordered">
				Свидетельство:<br/>
				<xsl:value-of select="catpi_ru:DocID"/>
			</td>
		</tr>
		<!--xsl:if test="catpi_ru:TransportMeansRegistrationId">
			<tr class="title">
				<td class="bordered part" colspan="4">
					Сведения о ТС
				</td>
			</tr>
			<tr>
				<td class="bordered" colspan="4">
					<table>
						<tbody>
							<tr>
								<td class="bordered">ID</td>
								<td class="bordered">Страна</td>
								<td class="bordered">VIN</td>
								<td class="bordered">Код вида</td>
								<td class="bordered">Код марки</td>
								<td class="bordered">Свидетельство</td>
							</tr>
							<xsl:apply-templates select="catpi_ru:TransportMeansRegistrationId"/>
						</tbody>
					</table>
				</td>
			</tr>
		</xsl:if удален-->
	</xsl:template>
	<xsl:template match="ap:TransitTerminationDetails">
		<tr>
			<td class="bordered">
				ТО:<br/>
				<xsl:apply-templates select="catpi_ru:CustomsOfficeDetails" mode="comma"/>
			</td>
			<td class="bordered">
				Номер ЗТК: <br/>
				<xsl:value-of select="catpi_ru:CustomsControlZoneId"/>
			</td>
			<td class="bordered">
				Cвидетельство: <br/>
				<xsl:apply-templates select="catpi_ru:RegisterDocumentIdDetails" mode="comma"/>
			</td>
			<td class="bordered">
				Код ж/д станции: <br/>
				<xsl:value-of select="catpi_ru:RailwayStationCode"/>
			</td>
		</tr>
		<xsl:if test="catpi_ru:SubjectAddressDetails">
			<tr>
				<td class="bordered" colspan="4">
					Адрес УЭО:<br/>
				</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:SubjectAddressDetails" mode="address"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ap:PITransitTransportMeansDetails">
		<tr>
			<td colspan="4" class="bordered">
				Признак совпадения ТС:<br/>
				<xsl:apply-templates select="catpi_ru:EqualIndicator" mode="indicator"/>
			</td>
			<!--td class="bordered">
				Код вида ТС:<br/>
				<xsl:value-of select="catpi_ru:TransporKind"/>
			</td>
			<td class="bordered">
				Количество:<br/>
				<xsl:value-of select="catpi_ru:TransportMeansQuantity"/>
			</td>
			<td class="bordered"/ удалены-->
		</tr>
		<xsl:if test="catpi_ru:TransportMeansRegistrationId">
			<tr class="title">
				<td class="bordered part" colspan="4">
					Сведения о ТС
				</td>
			</tr>
			<tr>
				<td class="bordered" colspan="4">
					<table>
						<tbody>
							<tr>
								<td class="bordered">ID</td>
								<td class="bordered">Страна</td>
								<td class="bordered">VIN</td>
								<td class="bordered">Код вида</td>
								<td class="bordered">Код марки</td>
								<td class="bordered">Модель</td>
								<td class="bordered">Свидетельство</td>
							</tr>
							<xsl:apply-templates select="catpi_ru:TransportMeansRegistrationId"/>
						</tbody>
					</table>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<xsl:template match="catpi_ru:TransportMeansRegistrationId">
		<tr>
			<td class="bordered">
				<xsl:value-of select="catpi_ru:TransportMeansRegId"/>
				<!--xsl:if test="catpi_ru:TrailerIdentifier">
					<xsl:text>/</xsl:text>
					<xsl:value-of select="catpi_ru:TrailerIdentifier"/>
				</xsl:if>
				<xsl:if test="catpi_ru:SecondTrailerIdentifier">
					<xsl:text>/</xsl:text>
					<xsl:value-of select="catpi_ru:SecondTrailerIdentifier"/>
				</xsl:if удалены-->
			</td>
			<td class="bordered">
				<xsl:value-of select="catpi_ru:RegistrationNationalityCode"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="catpi_ru:VehicleId"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="catpi_ru:UnifiedTransportModeCode"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="catpi_ru:VehicleMarkCode"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="catpi_ru:VehicleModelName"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="catpi_ru:DocID"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="*" mode="indicator">
		<xsl:choose>
			<xsl:when test=". = 1 or . = 'true'">есть</xsl:when>
			<xsl:otherwise>нет</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="ap:CustomsIdentificationDetails">
		<tr>
			<td class="bordered">
				Количество:<br/>
				<xsl:value-of select="catpi_ru:SealQuantity"/>
			</td>
			<td class="bordered">
				Код способа (и вида средства) идентификации:<br/>
				<xsl:value-of select="catpi_ru:CustomsIdentificationMethodCode"/>
				<xsl:if test="catpi_ru:CustomsIdentificationMeansKindCode">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="catpi_ru:CustomsIdentificationMeansKindCode"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
				<!--ID пломбиратора:<br/>
				<xsl:for-each select="catpi_ru:SealNumber">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each удален-->
			</td>
			<td class="bordered">
				ID средства идентификации:<br/>
				<xsl:for-each select="catpi_ru:CustomsIdentificationMeansIdDetails">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="catpi_ru:CustomsIdentificationMeansId"/>
				</xsl:for-each>
				<!--ID пломбы:<br/>
				<xsl:for-each select="catpi_ru:SealId">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each удален-->
			</td>
			<td class="bordered">
				Описание:<br/>
				<xsl:apply-templates select="catpi_ru:DescriptionText"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="*" mode="doc">
		<xsl:value-of select="cat_ru:PrDocumentName|catpi_ru:GeneralDocName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber|catpi_ru:GeneralNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate|catpi_ru:GeneralDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ap:BorderTransportDetails">
		<tr>
			<td class="bordered">
				Код вида<br/>
				<xsl:value-of select="ap:TransportModeCode"/>
			</td>
			<td class="bordered">
				<!--Кол-во<br/>
				<xsl:value-of select="ap:TransportMeansQuantity"/ удален-->
				№ п/п<br/>
				<xsl:value-of select="ap:ObjectOrdinal"/>
			</td>
			<td class="bordered">
				Признак контейнернах перевозок:<br/>
				<xsl:choose>
					<xsl:when test="ap:ContainerIndicator = 0 or ap:ContainerIndicator = 'false'">товары перевозятся не в контейнере</xsl:when>
					<xsl:when test="ap:ContainerIndicator = 1 or ap:ContainerIndicator = 'true'">товары перевозятся в контейнере</xsl:when>
				</xsl:choose>
			</td>
			<td class="bordered">
				Рег. номер воздушного судна<br/>
				<xsl:value-of select="ap:AirRegNumber"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код типа<br/>
				<xsl:value-of select="ap:TransportKindCode"/>
			</td>
			<td class="bordered">
				Код марки<br/>
				<xsl:value-of select="ap:MarkCode"/>
			</td>
			<td class="bordered">
				Марка<br/>
				<xsl:value-of select="ap:Mark"/>
			</td>
			<td class="bordered">
				Модель<br/>
				<xsl:value-of select="ap:Model"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код страны принадлежности<br/>
				<xsl:value-of select="ap:AirNationalityCode"/>
			</td>
			<td class="bordered">
				Сведения о рейсе<br/>
				<xsl:apply-templates select="ap:FlightDetails" mode="comma"/>
			</td>
			<td class="bordered">
				Дата и время рейса<br/>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ap:DepartureDateTime"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring(ap:DepartureDateTime, 12, 8)"/>
			</td>
			<td class="bordered">
				Маршрут<br/>
				<xsl:for-each select="ap:RouteDetails">
					<xsl:if test="position() &gt; 1">; </xsl:if>
					<xsl:apply-templates select="." mode="spaced"/>
				</xsl:for-each>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код цели ввоза<br/>
				<xsl:value-of select="ap:TransportMeansEntryPurpose"/>
			</td>
			<td class="bordered" colspan="3"/>
		</tr>
		<tr>
			<td class="bordered" colspan="4">
				Капитан<br/>
				<xsl:apply-templates select="ap:Captain" mode="spaced"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="2">
				Кол-во членов экипажа<br/>
				<xsl:value-of select="ap:CrewQuantity"/>
			</td>
			<td class="bordered" colspan="2">
				Кол-во пассажиров<br/>
				<xsl:value-of select="ap:PassengerQuantity"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="2">
				Сведения о членах экипажа<br/>
				<xsl:for-each select="ap:CrewMemberDetails">
					<xsl:if test="position() &gt; 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="spaced"/>
				</xsl:for-each>
			</td>
			<td class="bordered" colspan="2">
				Сведения о пассажирах<br/>
				<xsl:for-each select="ap:PassengerDetails">
					<xsl:if test="position() &gt; 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="spaced"/>
				</xsl:for-each>
			</td>
		</tr>
		<xsl:if test="ap:OperatorDetails">
			<tr class="title">
				<td class="bordered part" colspan="4">Эксплуaтант</td>
			</tr>
			<xsl:apply-templates select="ap:OperatorDetails" mode="org"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="org">
		<!--tr>
			<td class="bordered" colspan="4" style="border-top:2px solid gray;"></td>
		</tr-->
		<tr>
			<td class="bordered" colspan="4">Наименование организации / ФИО физического лица 
				<xsl:value-of select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
					<xsl:value-of select="cat_ru:ShortName"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="bordered">Сведения об организации</td>
			<td class="bordered" colspan="3">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
				<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
				<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
			</td>
		</tr>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<tr>
				<td class="bordered" colspan="2">Кодовое обозначение страны</td>
				<td class="bordered" colspan="2">
					<xsl:value-of select="RUScat_ru:CountryA2Code"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<tr>
				<td class="bordered" colspan="2">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
				<td class="bordered" colspan="2">
					<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode" mode="spaced"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<tr>
				<td class="bordered" colspan="2">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
				<td class="bordered" colspan="2">
					<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<tr>
				<td class="bordered" colspan="2">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</td>
				<td class="bordered" colspan="2">
					<xsl:apply-templates select="RUScat_ru:UITN" mode="spaced"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<tr>
				<td class="bordered" colspan="2">Уникальный идентификатор физического лица</td>
				<td class="bordered" colspan="2">
					<xsl:apply-templates select="RUScat_ru:PersonId"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="catpi_ru:EqualIndicator">
			<tr>
				<td class="bordered" colspan="2">
					<xsl:choose>
						<xsl:when test="contains(local-name(.), 'ConsignorDetails')">Признак совпадения с продавцом/покупателем</xsl:when>
						<xsl:when test="contains(local-name(.), 'ConsigneeDetails')">Признак совпадения с продавцом/покупателем</xsl:when>
						<xsl:when test="contains(local-name(.), 'DeclarantDetails')">Признак совпадения лица, представившего предварительную информацию, с перевозчиком, осуществляющим ввоз товаров на таможенную территорию Евразийского экономического союза</xsl:when>
					</xsl:choose>
				</td>
				<td class="bordered" colspan="2">
					<xsl:choose>
						<xsl:when test="catpi_ru:EqualIndicator=0 or catpi_ru:EqualIndicator='false'">не совпадают</xsl:when>
						<xsl:when test="catpi_ru:EqualIndicator=1 or catpi_ru:EqualIndicator='true'">совпадают</xsl:when>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="ap:AirlineId">
			<tr>
				<td class="bordered" colspan="2">Идентификатор авиакомпании, присвоенный Международной ассоциацией воздушного транспорта</td>
				<td class="bordered" colspan="2">
					<xsl:apply-templates select="ap:AirlineId"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<tr class="title">
				<td class="bordered part" colspan="4">Сведения о документе, удостоверяющем личность физического лица</td>
			</tr>
			<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="identityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<tr class="title">
				<td class="bordered part" colspan="4">Адрес</td>
			</tr>
			<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<tr class="title">
				<td class="bordered part" colspan="4">Контакты</td>
			</tr>
			<xsl:apply-templates select="RUScat_ru:CommunicationDetails" mode="contacts"/>
		</xsl:if>
		<xsl:if test="catpi_ru:RegisterDocumentIdDetails">
			<tr class="title">
				<td class="bordered part" colspan="4">Свидетельство о включении лица в реестр таможенных представителей</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:RegisterDocumentIdDetails" mode="certif"/>
		</xsl:if>
		<!--tr>
			<td class="bordered" colspan="4" style="border-top:2px solid gray;"></td>
		</tr-->
	</xsl:template>
	<xsl:template match="*" mode="certif">
		<tr>
			<td class="bordered">
				Код страны<br/>
				<xsl:value-of select="RUScat_ru:CountryA2Code"/>
				<xsl:value-of select="catpi_ru:CountryA2Code"/>
			</td>
			<td class="bordered">
				Рег. номер<br/>
				<xsl:value-of select="RUScat_ru:RegistrationNumberId"/>
				<xsl:value-of select="catpi_ru:RegistrationNumberId"/>
			</td>
			<td class="bordered">
				Признак перерегистрации<br/>
				<xsl:value-of select="RUScat_ru:ReregistrationCode"/>
				<xsl:value-of select="catpi_ru:ReregistrationCode"/>
			</td>
			<td class="bordered">
				Код типа<br/>
				<xsl:value-of select="RUScat_ru:AEORegistryKindCode"/>
				<xsl:value-of select="catpi_ru:AEORegistryKindCode"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="*" mode="contacts">
		<tr>
			<td class="bordered">
				Телефон<br/>
				<xsl:for-each select="cat_ru:Phone">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Факс<br/>
				<xsl:value-of select="cat_ru:Fax"/>
			</td>
			<td class="bordered">
				Телекс<br/>
				<xsl:value-of select="cat_ru:Telex"/>
			</td>
			<td class="bordered">
				E-mail<br/>
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<tr>
					<td class="bordered" colspan="4">
						<i>
							<xsl:value-of select="position()"/>
						</i>
						<xsl:text> </xsl:text>
						<xsl:value-of select="RUScat_ru:AddressText"/>
					</td>
				</tr>
			</xsl:when>
			<xsl:otherwise>
				<tr>
					<td class="bordered">
						<i>
							<xsl:value-of select="position()"/>
						</i>
						<br/>
						<xsl:choose>
							<xsl:when test="RUScat_ru:AddressKindCode=1">адрес регистрации</xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode=2">фактический адрес</xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode=3">почтовый адрес</xsl:when>
						</xsl:choose>
					</td>
					<td class="bordered">
						Индекс<br/>
						<xsl:value-of select="RUScat_ru:PostalCode"/>
					</td>
					<td class="bordered">
						Страна<br/>
						<xsl:value-of select="RUScat_ru:CountryCode"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="RUScat_ru:CounryName"/>
					</td>
					<td class="bordered">
						Регион<br/>
						<xsl:value-of select="RUScat_ru:Region"/>
					</td>
				</tr>
				<tr>
					<td class="bordered">
						Район<br/>
						<xsl:value-of select="RUScat_ru:District"/>
					</td>
					<td class="bordered">
						Город, населенный пункт<br/>
						<xsl:value-of select="RUScat_ru:Town"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="RUScat_ru:City"/>
					</td>
					<td class="bordered">
						Улица, дом, квартира<br/>
						<xsl:value-of select="RUScat_ru:StreetHouse"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="RUScat_ru:House"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="RUScat_ru:Room"/>
					</td>
					<td class="bordered">
						ОКАТО<br/>
						<xsl:value-of select="RUScat_ru:OKATO"/>
					</td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="identityCard">
		<tr>
			<td class="bordered">Серия<br/>
				<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
			</td>
			<td class="bordered">Номер<br/>
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</td>
			<td class="bordered">Дата выдачи<br/>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</td>
			<td class="bordered">Кем выдан<br/>
				<xsl:value-of select="RUScat_ru:OrganizationName"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="RUScat_ru:IssuerCode"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="*" mode="comma">
		<xsl:for-each select="*">
			<xsl:if test="position() &gt; 1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="spaced">
		<xsl:for-each select="*">
			<xsl:if test="position() &gt; 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:value-of select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures| RUScat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures| RUScat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures| RUScat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures| RUScat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures| RUScat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ap:EntryCheckPointDetails">
		<tr>
			<td class="bordered" width="25%">
				Код ТО<br/>
				<xsl:value-of select="ap:CustomsOfficeCode"/>
			</td>
			<td class="bordered" width="25%">
				Аэропорт<br/>
				<xsl:value-of select="ap:AirportCode"/>
			</td>
			<td class="bordered" width="25%">
				Код пункта пропуска<br/>
				<xsl:value-of select="ap:BorderCheckpointCode"/>
			</td>
			<td class="bordered" width="25%">
				Наименование пункта пропуска<br/>
				<xsl:value-of select="ap:BorderCheckpointName"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="*" mode="regnum">
		<xsl:value-of select="catpi_ru:CountryCode|cat_ru:CustomsCode|catpi_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="num_date">
			<xsl:with-param name="dateIn" select="catpi_ru:Date|cat_ru:RegistrationDate|catpi_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="catpi_ru:PINumber|cat_ru:GTDNumber|catpi_ru:SerialNumber"/>
	</xsl:template>
	<xsl:template name="num_date">
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
