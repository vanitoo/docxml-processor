<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:autop="urn:customs.ru:Information:CustomsDocuments:AutoPreliminary:5.28.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:catpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonAggregateTypes:5.28.0">
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
	<xsl:template match="//*[local-name()='AutoPreliminary']//*" priority="-1">
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
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<!-- Шаблон для типа AutoPreliminaryType -->
	<xsl:template match="autop:AutoPreliminary">
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
						<tr class="title" align="center">
							<td class="bordered" colspan="4" style="text-decoration:underline">Предварительная информация о товарах, предполагаемых к ввозу на таможенную территорию Евразийского экономического союза автомобильным транспортом</td>
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
												<xsl:attribute name="src">
													<xsl:value-of select="concat('data:image/bmp;base64,', $bmpData)"/>
												</xsl:attribute>
											</img> 
										</td>
									</tr>
								</xsl:if>
							</xsl:if>
						 </xsl:if>
						<xsl:if test="autop:RegNumber">
							<tr>
								<td class="bordered" colspan="4">
									Регистрационный номер предварительной информации, содержащей обязательный состав сведений <br/>
									<xsl:apply-templates select="autop:RegNumber" mode="regnum"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="autop:RefRegNumber">
							<tr>
								<td class="bordered" colspan="4">
									Регистрационный номер предварительной информации, в отношении которой осуществляется повторное представление предварительной информации <br/>
									<xsl:apply-templates select="autop:RefRegNumber" mode="regnum"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="autop:UsageCode">
							<tr>
								<td class="bordered" colspan="4">
									Код цели представления предварительной информации <br/>
									<xsl:for-each select="autop:UsageCode">
										<xsl:if test="position() &gt; 1">, </xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="autop:EntryCheckPointDetails">
							<tr class="title" align="center">
								<td class="bordered" colspan="4" style="background-color:#ccc;">Место прибытия товаров</td>
							</tr>
							<xsl:apply-templates select="autop:EntryCheckPointDetails"/>
						</xsl:if>
						
						<tr class="title" align="center">
								<td class="bordered" colspan="4" style="background-color:#ccc;">Лицо, представившее предварительную информацию</td>
						</tr>
						<xsl:apply-templates select="autop:DeclarantDetails" mode="org"/>
						
						<tr class="title" align="center">
							<td class="bordered" colspan="4" style="background-color:#ccc;">Сведения о транспортном средстве</td>
						</tr>
						<xsl:apply-templates select="autop:BorderTransportDetails"/>
						
						<xsl:if test="autop:MainConsignmentDetails">
							<tr class="title" align="center">
								<td class="bordered" colspan="4" style="background-color:#ccc;">Сведения о перевозке товаров</td>
							</tr>
							<xsl:apply-templates select="autop:MainConsignmentDetails"/>
						</xsl:if>
						
						<xsl:if test="autop:CarrierDetails">
							<tr class="title" align="center">
								<td class="bordered" colspan="4" style="background-color:#ccc;">Сведения о перевозчике, осуществляющем ввоз товаров на таможенную территорию Евразийского экономического союза</td>
							</tr>
							<xsl:apply-templates select="autop:CarrierDetails" mode="org"/>
						</xsl:if>
						
						<xsl:apply-templates select="autop:SparePartsInfo"/>
						
						<xsl:if test="autop:ControlledItemsDetails">
							<tr class="title">
								<td class="bordered" colspan="4" style="background-color:#ccc;">Сведения о наличии на транспортном средстве запасных частей или оборудования для ремонта</td>
							</tr>
							<xsl:apply-templates select="autop:ControlledItemsDetails"/>
						</xsl:if>
						
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="autop:ControlledItemsDetails">
		<tr>
			<td class="bordered">
				<xsl:choose>
					<xsl:when test="catpi_ru:InformationKindCode = 1">припасы</xsl:when>
					<xsl:when test="catpi_ru:InformationKindCode = 2">лекарственные средства, в составе которых содержатся наркотические, сильнодействующие средства, психотропные и ядовитые вещества</xsl:when>
					<xsl:when test="catpi_ru:InformationKindCode = 3">опасные товары (исключая оружие и (или) боеприпасы)</xsl:when>
					<xsl:when test="catpi_ru:InformationKindCode = 4">запасные части и оборудование</xsl:when>
					<xsl:when test="catpi_ru:InformationKindCode = 5">оружие и (или) боеприпасы</xsl:when>
					<xsl:otherwise><xsl:value-of select="catpi_ru:InformationKindCode"/></xsl:otherwise>
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
					<xsl:if test="position()!=1"><br/></xsl:if>
					<xsl:apply-templates select="catpi_ru:GoodsDescription"/>
					<xsl:text> </xsl:text>
					<xsl:apply-templates mode="quantity" select="catpi_ru:Quantity"/>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="autop:SparePartsInfo">
		<tr class="title">
			<td class="bordered" colspan="4" style="background-color:#ccc;">Запчасти или оборудование для ремонта</td>
		</tr>
		<tr>
			<td class="bordered">Наличие запасных частей</td>
			<td class="bordered" colspan="3"><xsl:apply-templates select="catpi_ru:StoreIndicator" mode="indicator"/></td>
		</tr>
		<xsl:if test="catpi_ru:SparePartsItemDetails">
			<tr>
				<td class="bordered" colspan="4">Наименование и количиество запчастей</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:SparePartsItemDetails"/>
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
	
	<xsl:template match="autop:MainConsignmentDetails">
		<tr>
			<td class="bordered" colspan="2">
				Признак осуществления перевозки по книжке МДП
			</td>
			<td class="bordered" colspan="2">
				<xsl:apply-templates select="autop:TIRCarnetIndicator" mode="indicator"/>
			</td>
		</tr>
		<xsl:if test="autop:TIRCarnetIdDetails">
			<tr>
				<td class="bordered" colspan="4">Сведения о книжке МДП</td>
			</tr>
			<xsl:apply-templates select="autop:TIRCarnetIdDetails"/>
		</xsl:if>
		<tr>
			<td class="bordered">
				Код типа ТД<br/>
				<xsl:apply-templates select="autop:DeclarationKindCode"/>
			</td>
			<td class="bordered">
				Код особенности перевозки<br/>
				<xsl:apply-templates select="autop:TransitProcedureCode"/>
			</td>
			<td class="bordered">
				Код предназначения<br/>
				<xsl:apply-templates select="autop:TransitFeatureCode"/>
			</td>
			<td class="bordered">
				Код особенности декларирования<br/>
				<xsl:value-of select="autop:DeclarationFeatureCode"/>
				<!--Кол-во отгруз. спецификаций<br/>
				<xsl:apply-templates select="autop:LoadingListsQuantity"/ удален-->
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код исп. трансп. (перевоз.), коммерч. и (или) иных док-тов в качестве ТД<br/>
				<xsl:value-of select="autop:DocUsageCode"/>
				<!--Кол-во листов отгр. сп-ций<br/>
				<xsl:apply-templates select="autop:LoadingListsPageQuantity"/ удален-->
			</td>
			<td class="bordered">
				Общее число товаров<br/>
				<xsl:apply-templates select="autop:GoodsQuantity"/>
			</td>
			<td class="bordered">
				Общее кол-во груз.мест<br/>
				<xsl:apply-templates select="autop:CargoQuantity"/>
			</td>
			<td class="bordered">
				Общее количество листов в документе<br/>
				<xsl:value-of select="autop:PageQuantity"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="2">
				Общий вес товаров брутто<br/>
				<xsl:value-of select="autop:TotalGrossMassMeasure"/>
			</td>
			<td class="bordered" colspan="2">
				Общая стоимость товаров<br/>
				<xsl:apply-templates select="autop:TotalAmount" mode="spaced"/>
			</td>
		</tr>
		<xsl:if test="autop:CustomsIdentificationDetails">
			<tr>
				<td class="bordered" colspan="4">Сведения о средствах идентификации</td>
			</tr>
			<xsl:apply-templates select="autop:CustomsIdentificationDetails"/>
		</xsl:if>
		<xsl:if test="autop:PITransitTransportMeansDetails">
			<tr>
				<td class="bordered" colspan="4">Сведения о ТС</td>
			</tr>
			<xsl:apply-templates select="autop:PITransitTransportMeansDetails"/>
		</xsl:if>
		<xsl:if test="autop:TransitTerminationDetails">
			<tr class="title">
				<td class="bordered" colspan="4">
					Сведения о предполагаемом ТО и пункте назначения
				</td>
			</tr>
			<xsl:apply-templates select="autop:TransitTerminationDetails"/>
		</xsl:if>
		
		<xsl:apply-templates select="autop:PITranshipmentDetails"/>
		
		<xsl:apply-templates select="autop:ConsignmentDetails"/>
		
		<xsl:apply-templates select="autop:TransitGuaranteeDetails"/>
		
		<xsl:if test="autop:TransitDeclarantDetails">
			<tr class="title">
				<td class="bordered" colspan="4"  style="font-style:oblique;background-color:#ccc;">Декларант таможенной процедуры таможенного транзита</td>
			</tr>
			<xsl:apply-templates select="autop:TransitDeclarantDetails" mode="org"/>
		</xsl:if>
		
		<xsl:if test="autop:UnionCarrierDetails">
			<tr class="title">
				<td class="bordered" colspan="4"  style="font-style:oblique;background-color:#ccc;">Перевозчик товаров по таможенной территории Евразийского экономического союза</td>
			</tr>
			<xsl:for-each select="autop:UnionCarrierDetails">
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
		
		<xsl:if test="autop:SignatoryRepresentativeDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style:oblique;background-color:#ccc;">Таможенный представитель, заполнивший (подписавший) таможенный документ</td>
			</tr>
			<tr>
				<td class="bordered part" colspan="2" style="font-weight:bold;font-family: Arial;font-size: 9pt;">
					Сведения о включении лица в реестр таможенных представителей
				</td>
				<td class="bordered" colspan="2">
					Код вида док-та: 
					<xsl:value-of select="autop:SignatoryRepresentativeDetails/catpi_ru:RegisterDocumentIdDetails/catpi_ru:DocKindCode"/>
				</td>
			</tr>
			<xsl:apply-templates select="autop:SignatoryRepresentativeDetails/catpi_ru:RegisterDocumentIdDetails" mode="certif"/>
			<tr class="title">
				<td class="bordered part" colspan="4">
					Договор таможенного представителя с декларантом (заявителем)
				</td>
			</tr>
			<tr>
				<td class="bordered">
					Реквизиты: 
					<xsl:apply-templates select="autop:SignatoryRepresentativeDetails/catpi_ru:RepresentativeContractDetails" mode="doc"/>
				</td>
				<td class="bordered">
					Дата начала срока, в течение которого док-т имеет силу: 
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="autop:SignatoryRepresentativeDetails/catpi_ru:RepresentativeContractDetails/RUScat_ru:DocStartDate"/></xsl:call-template>
				</td>
				<td class="bordered">
					Дата окончания срока, в течение которого док-т имеет силу: 
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="autop:SignatoryRepresentativeDetails/catpi_ru:RepresentativeContractDetails/RUScat_ru:DocValidityDate"/></xsl:call-template>
				</td>
				<td class="bordered">
					Код вида док-та: 
					<xsl:value-of select="autop:SignatoryRepresentativeDetails/catpi_ru:RepresentativeContractDetails/RUScat_ru:DocKindCode"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:apply-templates select="autop:SignatoryPersonDetails"/>
		
		<!--xsl:if test="autop:RailwayStampDetails">
			<tr>
				<td class="bordered title" colspan="2" style="font-style:oblique;background-color:#ccc;">Сведения из календарного штемпеля железнодорожной станции</td>
				<td class="bordered" colspan="2">
					<xsl:apply-templates select="autop:RailwayStampDetails" mode="comma"/>
				</td>
			</tr>
		</xsl:if удален-->
		
	</xsl:template>

	<xsl:template match="autop:SignatoryPersonDetails">
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
	
	<xsl:template match="autop:TransitGuaranteeDetails">
		<tr class="title">
			<td class="bordered" colspan="4"  style="font-style:oblique;background-color:#ccc;">Сведения об обеспечении исполнения обязанности по уплате таможенных и иных платежей при таможенной процедуре таможенного транзита</td>
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
				<xsl:apply-templates select="catpi_ru:NationalGuaranteeCode"/>
			</td>
			<td class="bordered">
				Код страны<br/>
				<xsl:for-each select="catpi_ru:NonGuaranteeCountryCode">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Документ о включении в реестр<br/>
				<xsl:apply-templates select="catpi_ru:RegisterDocumentIdDetails" mode="comma"/>
			</td>
			<td class="bordered">
				Наименование гаранта<br/>
				<xsl:apply-templates select="catpi_ru:GuaranteeName"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				УНП<br/>
				<xsl:apply-templates select="catpi_ru:UNP"/>
			</td>
			<td class="bordered">
				Код МФО/БИК<br/>
				<xsl:apply-templates select="catpi_ru:BIC"/>
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

	<xsl:template match="autop:ConsignmentDetails">
		<tr class="title" align="center">
			<td class="bordered" colspan="4" style="font-style: oblique; background-color: #999">Сведения о товарной партии № <xsl:value-of select="autop:ObjectOrdinal"/></td>
		</tr>
		<tr>
			<td class="bordered" colspan="2">
				Транспортный документ:<br/>
				<xsl:apply-templates select="autop:TransportDocumentDetails" mode="doc"/>
			</td>
			<td class="bordered" colspan="2">
				Рег.номер ТД<br/>
				<xsl:apply-templates select="autop:CustomsDocIdDetails" mode="regnum"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Общее кол-во грузовых мест<br/>
				<xsl:apply-templates select="autop:CargoQuantity"/>
			</td>
			<td class="bordered">
				Страна отправления<br/>
				<xsl:apply-templates select="autop:DispatchCountryCode"/>
			</td>
			<td class="bordered">
				Страна назначения<br/>
				<xsl:apply-templates select="autop:DestinationCountryCode"/>
			</td>
			<td class="bordered">
				Общая стоимость товаров<br/>
				<xsl:apply-templates select="autop:TotalAmount" mode="spaced"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Общий вес брутто (кг)<br/>
				<xsl:apply-templates select="autop:GrossWeightQuantity"/>
			</td>
			<td class="bordered">
				Общий вес брутто (кг)<br/>
				<xsl:apply-templates select="autop:GrossWeightQuantity"/>
			</td>
			<td class="bordered" colspan="2">
			
			</td>
		</tr>
		<xsl:if test="autop:ConsignorDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;background-color:#ccc;">Отправитель</td>
			</tr>
			<xsl:apply-templates select="autop:ConsignorDetails" mode="org"/>
		</xsl:if>
		<xsl:if test="autop:ConsigneeDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;background-color:#ccc;">Получатель</td>
			</tr>
			<xsl:apply-templates select="autop:ConsigneeDetails" mode="org"/>
		</xsl:if>
		
		<xsl:if test="autop:SellerDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;background-color:#ccc;">Продавец</td>
			</tr>
			<xsl:apply-templates select="autop:SellerDetails" mode="org"/>
		</xsl:if>
		<xsl:if test="autop:BuyerDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style: oblique;background-color:#ccc;">Покупатель</td>
			</tr>
			<xsl:apply-templates select="autop:BuyerDetails" mode="org"/>
		</xsl:if>
		
		<tr>
			<td class="bordered" colspan="2">
				Место погрузки: 
				<xsl:apply-templates select="autop:LoadingLocationDetails"/>
			</td>
			<td class="bordered" colspan="2">
				Место разгрузки: 
				<xsl:apply-templates select="autop:UnLoadingLocationDetails"/>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="4">
				ТО назначения: 
				<xsl:apply-templates select="autop:DestinationDetails/autop:PlaceName"/>
				<xsl:if test="autop:DestinationDetails/autop:CustomsCode"> (<xsl:apply-templates select="autop:DestinationDetails/autop:CustomsCode"/>)</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="bordered" colspan="4">
				Сведения о контейнере: 
				<xsl:for-each select="autop:ContainerDetails">
					<xsl:if test="position() &gt; 1">; </xsl:if>
					<xsl:apply-templates select="." mode="spaced"/>
				</xsl:for-each>
			</td>
		</tr>
		
		<xsl:if test="autop:UnloadWarehouseDetails">
			<tr class="title">
				<td class="bordered" colspan="4" style="font-style:oblique;background-color:#ccc;">Сведения о планируемом месте временного хранения</td>
			</tr>
			<xsl:apply-templates select="autop:UnloadWarehouseDetails"/>
		</xsl:if>
		
		<xsl:apply-templates select="autop:GoodsItem"/>
		
	</xsl:template>
	
	<xsl:template match="autop:GoodsItem">
		<tr class="title">
			<td class="bordered" colspan="4"  style="font-style:oblique;background-color:#ccc;">Сведения о товаре <xsl:apply-templates select="catpi_ru:GoodsNumeric"/></td>
		</tr>
		<tr>
			<td class="bordered">
				Код ТН ВЭД<br/>
				<xsl:apply-templates select="catpi_ru:GoodsTNVEDCode"/>
			</td>
			<td class="bordered">
				Описание:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsDescription"/>
			</td>
			<td class="bordered">
				Вес брутто (кг)<br/>
				<xsl:apply-templates select="catpi_ru:GrossWeightQuantity"/>
			</td>
			<td class="bordered">
				Вес нетто (кг)<br/>
				<xsl:apply-templates select="catpi_ru:NetWeightQuantity"/>
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
					<xsl:apply-templates select="."/>
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
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Описание маркировки:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsLabelDescription"/>
			</td>
			<td class="bordered">
				Назначение области применения:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsUsageDescription"/>
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
						<xsl:if test="position() &gt; 1"><br/></xsl:if>
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
					<xsl:if test="position() &gt; 1"><br/></xsl:if>
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
					<xsl:if test="position() &gt; 1"><br/></xsl:if>
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
				<xsl:apply-templates select="RUScat_ru:DocStartDate" mode="russian_date"/>
			</td>
			<td class="bordered">
				Действует по:<br/>
				<xsl:apply-templates select="RUScat_ru:DocValidityDate" mode="russian_date"/>
			</td>
			<td class="bordered">
				Код страны<br/>
				<xsl:apply-templates select="RUScat_ru:CountryCode"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код вида док-та<br/>
				<xsl:apply-templates select="catpi_ru:DocKindCode"/>
			</td>
			<td class="bordered">
				Орган гос.власти:<br/>
				<xsl:apply-templates select="catpi_ru:AuthorityName"/>
			</td>
			<td class="bordered">
				ИД органа:<br/>
				<xsl:apply-templates select="catpi_ru:AuthorityId"/>
			</td>
			<td class="bordered">
				Типографский № бланка:<br/>
				<xsl:apply-templates select="catpi_ru:FormNumberId"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Учетная серия корма:<br/>
				<xsl:apply-templates select="catpi_ru:RegistrationSeriesId"/>
			</td>
			<td class="bordered">
				Код товара по ТН ВЭД:<br/>
				<xsl:apply-templates select="catpi_ru:TnvedCode"/>
			</td>
			<td class="bordered">
				Торг. наименование:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsDescription" mode="spaced"/>
			</td>
			<td class="bordered">
				Описание маркировки:<br/>
				<xsl:apply-templates select="catpi_ru:GoodsLabelDescription"/>
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
				<xsl:apply-templates select="catpi_ru:EventDate" mode="russian_date"/>
			</td>
			<td class="bordered">
				Продолжительность:<br/>
				<xsl:apply-templates select="catpi_ru:ExpositionDuration"/>
			</td>
			<td class="bordered">
				Способ обработки:<br/>
				<xsl:apply-templates select="catpi_ru:DisinfectionMethodName"/>
			</td>
			<td class="bordered">
				Химикат:<br/>
				<xsl:apply-templates select="catpi_ru:ChemicalName"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Температура:<br/>
				<xsl:apply-templates select="catpi_ru:TemperatureMeasure"/>
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
				<xsl:apply-templates select="catpi_ru:DescriptionText"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="catpi_ru:CargoPackagePalletDetails">
		<tr>
			<td class="bordered">
				Общее кол-во грузовых мест<br/>
				<xsl:apply-templates select="catpi_ru:PakageQuantity"/>
			</td>
			<td class="bordered">
				Код наличия упаковки<br/>
				<xsl:apply-templates select="catpi_ru:PakageTypeCode"/>
			</td>
			<td class="bordered">
				Кол-во частично занятых гр.мест<br/>
				<xsl:apply-templates select="catpi_ru:PakagePartQuantity"/>
			</td>
			<td class="bordered">
				Вид грузовых мест<br/>
				<xsl:apply-templates select="catpi_ru:PakageKindName"/>
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
	
	<xsl:template match="autop:UnloadWarehouseDetails">
		<tr>
			<td class="bordered">
				Код<br/>
				<xsl:apply-templates select="catpi_ru:InformationTypeCode"/>
			</td>
			<td class="bordered">
				Наименование<br/>
				<xsl:apply-templates select="catpi_ru:PlaceName"/>
			</td>
			<td class="bordered">
				Дата<br/>
				<xsl:apply-templates select="catpi_ru:WarehouseDate" mode="russian_date"/>
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
		<xsl:apply-templates select="catpi_ru:Description"/>
	</xsl:template>

	<xsl:template match="autop:PITranshipmentDetails">
		<tr class="title">
			<td class="bordered" colspan="4" style="font-style: oblique; background-color:#ccc;">
				Планируемая грузовая операция <xsl:value-of select="position()"/><xsl:if test="catpi_ru:CarrierOrdinal"> (продолжает перевозчик №<xsl:value-of select="catpi_ru:CarrierOrdinal"/>)</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код вида<br/>
				<xsl:apply-templates select="catpi_ru:CargoOperationKindCode"/>
			</td>
			<td class="bordered">
				Признак перегрузки товаров:<br/>
				<xsl:apply-templates select="catpi_ru:ContainerIndicator" mode="indicator"/>
			</td>
			<td class="bordered">
				Код страны: <br/>
				<xsl:apply-templates select="catpi_ru:CountryCode"/>
			</td>
			<td class="bordered">
				Страна<br/>
				<xsl:apply-templates select="catpi_ru:CountryName"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Место:<br/>
				<xsl:apply-templates select="catpi_ru:PlaceName"/>
			</td>
			<td class="bordered">
				ТО<br/>
				<xsl:apply-templates select="catpi_ru:CustomsOfficeCode"/>
			</td>
			<td class="bordered">
				Код ж/д станции<br/>
				<xsl:value-of select="catpi_ru:RailwayStationCode"/>
				<!--№ нового контейнера:<br/>
				<xsl:for-each select="catpi_ru:ContainerNumber">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each удален-->
			</td>
			<td class="bordered">
				Описание:<br/>
				<xsl:apply-templates select="catpi_ru:Description"/>
			</td>
		</tr>
		<xsl:if test="catpi_ru:TranshipmentTransportMeansDetails">
			<tr>
				<td class="bordered" colspan="4">Сведения о ТС при совершении грузовой операции</td>
			</tr>
			<xsl:apply-templates select="catpi_ru:TranshipmentTransportMeansDetails"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="catpi_ru:TranshipmentTransportMeansDetails">
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
	
	<xsl:template match="autop:TransitTerminationDetails">
		<tr>
			<td class="bordered">
				ТО:<br/>
				<xsl:apply-templates select="catpi_ru:CustomsOfficeDetails" mode="comma"/>
			</td>
			<td class="bordered">
				Номер ЗТК: <br/>
				<xsl:apply-templates select="catpi_ru:CustomsControlZoneId"/>
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
	
	<xsl:template match="autop:PITransitTransportMeansDetails">
		<tr>
			<td colspan="4" class="bordered">
				Признак совпадения ТС:<br/>
				<xsl:apply-templates select="catpi_ru:EqualIndicator" mode="indicator"/>
			</td>
			<!--td class="bordered">
				Код вида ТС:<br/>
				<xsl:apply-templates select="catpi_ru:TransporKind"/>
			</td>
			<td class="bordered">
				Количество:<br/>
				<xsl:apply-templates select="catpi_ru:TransportMeansQuantity"/>
			</td>
			<td class="bordered"></td удалены-->
		</tr>
		<xsl:if test="catpi_ru:TransportMeansRegistrationId">
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
					<xsl:apply-templates select="catpi_ru:TrailerIdentifier"/>
				</xsl:if>
				<xsl:if test="catpi_ru:SecondTrailerIdentifier">
					<xsl:text>/</xsl:text>
					<xsl:apply-templates select="catpi_ru:SecondTrailerIdentifier"/>
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
	
	<xsl:template match="autop:CustomsIdentificationDetails">
		<tr>
			<td class="bordered">
				Кол-во<br/>
				<xsl:apply-templates select="catpi_ru:SealQuantity"/>
			</td>
			<td class="bordered">
				Код способа (и вида средства) идентификации:<br/>
				<xsl:value-of select="catpi_ru:CustomsIdentificationMethodCode"/>
				<xsl:if test="catpi_ru:CustomsIdentificationMeansKindCode">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="catpi_ru:CustomsIdentificationMeansKindCode"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
				<!--Номер:<br/>
				<xsl:for-each select="catpi_ru:SealNumber">
					<xsl:if test="position() &gt; 1"><br/></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each удален-->
			</td>
			<td class="bordered">
				ID средства идентификации:<br/>
				<xsl:for-each select="catpi_ru:CustomsIdentificationMeansIdDetails">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:value-of select="catpi_ru:CustomsIdentificationMeansId"/>
				</xsl:for-each>
				<!--ID:<br/>
				<xsl:for-each select="catpi_ru:SealId">
					<xsl:if test="position() &gt; 1"><br/></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each удален-->
			</td>
			<td class="bordered">
				Описание:<br/>
				<xsl:apply-templates select="catpi_ru:DescriptionText"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="autop:TIRCarnetIdDetails">
		<tr>
			<td class="bordered">
				Серия<br/>
				<xsl:apply-templates select="autop:TIRSeries"/>
			</td>
			<td class="bordered">
				Номер<br/>
				<xsl:apply-templates select="autop:TIRID"/>
			</td>
			<td class="bordered">
				Номер листа<br/>
				<xsl:apply-templates select="autop:TIRPageOrdinal"/>
			</td>
			<td class="bordered">
				ID держателя<br/>
				<xsl:apply-templates select="autop:TIRHolderID"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="*" mode="indicator">
		<xsl:variable name="xpath_indicator">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_indicator}">
			<xsl:choose>
				<xsl:when test=". = 1 or . = 'true'">есть</xsl:when>
				<xsl:otherwise>нет</xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="*" mode="doc">
		<xsl:apply-templates select="cat_ru:PrDocumentName|catpi_ru:GeneralDocName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber|catpi_ru:GeneralNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate|catpi_ru:GeneralDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="autop:BorderTransportDetails">
		<tr>
			<td class="bordered" colspan="2">
				Код вида<br/>
				<xsl:apply-templates select="autop:TransportModeCode"/>
			</td>
			<!--td class="bordered">
				Кол-во<br/>
				<xsl:apply-templates select="autop:TransportMeansQuantity"/>
			</td удален-->
			<td class="bordered" colspan="2">
				Признак контейнерных перевозок:<br/>
				<xsl:variable name="xpath_ContainerIndicator">
					<xsl:call-template name="get_xpath">
						<xsl:with-param name="node" select="autop:ContainerIndicator"/>
					</xsl:call-template>
				</xsl:variable>
				<element xml_node="{$xpath_ContainerIndicator}">
					<xsl:choose>
						<xsl:when test="autop:ContainerIndicator = 0 or autop:ContainerIndicator = 'false'">товары перевозятся не в контейнере</xsl:when>
						<xsl:when test="autop:ContainerIndicator = 1 or autop:ContainerIndicator = 'true'">товары перевозятся в контейнере</xsl:when>
					</xsl:choose>
				</element>
			</td>
			<!--td class="bordered">
				Рег. номер ТС<br/>
				<xsl:apply-templates select="autop:TransportMeansRegId"/>
			</td удален-->
		</tr>
		<xsl:if test="autop:PIATTransportMeansItemDetails">
			<tr>
				<td class="bordered" colspan="4">
					Сведения об идентификации транспортного средства:<br/>
				</td>
			</tr>
			<xsl:for-each select="autop:PIATTransportMeansItemDetails">
				<xsl:sort case-order="lower-first" data-type="number" order="ascending" select="autop:ObjectOrdinal"/>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<!--tr>
			<td class="bordered">
				Код страны<br/>
				<xsl:apply-templates select="autop:TransportMeansCountryCode"/>
			</td>
			<td class="bordered">
				ID VIN<br/>
				<xsl:apply-templates select="autop:VINID"/>
			</td>
			<td class="bordered">
				ID шасси<br/>
				<xsl:apply-templates select="autop:ChassisID"/>
			</td>
			<td class="bordered">
				ID кузова<br/>
				<xsl:apply-templates select="autop:BodyID"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Код типа ТСМП<br/>
				<xsl:apply-templates select="autop:TransportKindCode"/>
			</td>
			<td class="bordered">
				Код марки ТС:<br/>
				<xsl:apply-templates select="autop:MarkCode"/>
			</td>
			<td class="bordered">
				Марка:<br/>
				<xsl:apply-templates select="autop:Mark"/>
			</td>
			<td class="bordered">
				Модель:<br/>
				<xsl:apply-templates select="autop:Model"/>
			</td>
		</tr удалены-->
		<!--xsl:if test="autop:TrailerDetails">
			<tr>
				<td class="bordered" colspan="4">
					Сведения о прицепном транспортном средстве:<br/>
					<xsl:for-each select="autop:TrailerDetails">
						<xsl:if test="position() &gt; 1"><br/></xsl:if>
						<xsl:apply-templates select="." mode="comma"/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if удален-->
		<tr>
			<td class="bordered">
				Общая масса ТС<br/>
				<xsl:apply-templates select="autop:TransportMeansGrossMass" mode="quantity"/>
			</td>
			<td class="bordered">
				Маршрут следования:<br/>
				<xsl:for-each select="autop:ItineraryPointDetails">
					<xsl:sort case-order="lower-first" data-type="number" order="ascending" select="autop:ObjectOrdinal"/>
					<xsl:if test="position() &gt; 1">;<br/></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Цель ввоза:<br/>
				<xsl:variable name="xpath_Purpose">
					<xsl:call-template name="get_xpath">
						<xsl:with-param name="node" select="autop:Purpose"/>
					</xsl:call-template>
				</xsl:variable>
				<element xml_node="{$xpath_Purpose}">
					<xsl:choose>
						<xsl:when test="autop:Purpose = 1">для начала международной перевозки грузов, пассажиров и (или) багажа на таможенной территории</xsl:when>
						<xsl:when test="autop:Purpose = 2">для начала международной перевозки грузов, пассажиров и (или) багажа за пределы таможенной территории</xsl:when>
						<xsl:when test="autop:Purpose = 3">для завершения международной перевозки грузов, пассажиров и (или) багажа на таможенной территории</xsl:when>
						<xsl:when test="autop:Purpose = 4">для завершения международной перевозки грузов, пассажиров и (или) багажа за пределами таможенной территории)</xsl:when>
						<xsl:otherwise><xsl:value-of select="autop:Purpose"/></xsl:otherwise>
					</xsl:choose>
				</element>
			</td>
			<td class="bordered">
				Разрешение:<br/>
				<xsl:for-each select="autop:PermitTranspornationDocDetails">
					<xsl:if test="position() &gt; 1">;<br/></xsl:if>
					<xsl:apply-templates select="." mode="comma"/>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="autop:ItineraryPointDetails">
		<xsl:apply-templates select="autop:ObjectOrdinal"/>
		<xsl:text>.</xsl:text>
		<xsl:if test="autop:PlaceName">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="autop:PlaceName"/>
		</xsl:if>
		<xsl:if test="autop:CountryCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="autop:CountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:if test="autop:CustomsOfficeName or autop:CustomsOfficeCode">
			<xsl:text>, ТО - </xsl:text>
		</xsl:if>
		<xsl:if test="autop:CustomsOfficeName">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="autop:CustomsOfficeName"/>
		</xsl:if>
		<xsl:if test="autop:CustomsOfficeCode">
			<xsl:text> </xsl:text>
			<xsl:if test="autop:CustomsOfficeName">
				<xsl:text>(</xsl:text>
			</xsl:if>
			<xsl:apply-templates select="autop:CustomsOfficeCode"/>
			<xsl:if test="autop:CustomsOfficeName">
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
		<xsl:if test="autop:Date">
			<xsl:text>, дата - </xsl:text>
			<xsl:apply-templates select="autop:Date" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="autop:PIATTransportMeansItemDetails">
		<tr>
			<td class="bordered" colspan="4">
				Порядковый № <xsl:apply-templates select="autop:ObjectOrdinal"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				Рег. номер:<br/>
				<xsl:apply-templates select="autop:TransportMeansRegId"/>
			</td>
			<td class="bordered">
				Код типа ТСМП:<br/>
				<xsl:apply-templates select="autop:TransportKindCode"/>
			</td>
			<td class="bordered">
				Код марки:<br/>
				<xsl:apply-templates select="autop:MarkCode"/>
			</td>
			<td class="bordered">
				Наим. модели:<br/>
				<xsl:apply-templates select="autop:Model"/>
			</td>
		</tr>
		<tr>
			<td class="bordered">
				VIN:<br/>
				<xsl:apply-templates select="autop:VINID"/>
			</td>
			<td class="bordered">
				ID номер шасси (рамы):<br/>
				<xsl:apply-templates select="autop:ChassisID"/>
			</td>
			<td class="bordered">
				ID номер кузова (кабины):<br/>
				<xsl:apply-templates select="autop:BodyID"/>
			</td>
			<td class="bordered">
				Номер свид-ва о рег.:<br/>
				<xsl:apply-templates select="autop:DocId"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']|*[local-name() = 'MeasuredAmount']"/>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierName']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="org">
		<!--tr>
			<td class="bordered" colspan="4" style="border-top:2px solid gray;"></td>
		</tr-->
		<tr>
			<td class="bordered" colspan="4">Наименование организации / ФИО физического лица 
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
					<xsl:apply-templates select="cat_ru:ShortName"/>
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
				<td class="bordered" colspan="2"><xsl:apply-templates select="RUScat_ru:CountryA2Code"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<tr>
				<td class="bordered" colspan="2">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
				<td class="bordered" colspan="2"><xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode" mode="spaced"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<tr>
				<td class="bordered" colspan="2">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
				<td class="bordered" colspan="2"><xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<tr>
				<td class="bordered" colspan="2">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</td>
				<td class="bordered" colspan="2"><xsl:apply-templates select="RUScat_ru:UITN" mode="spaced"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<tr>
				<td class="bordered" colspan="2">Уникальный идентификатор физического лица</td>
				<td class="bordered" colspan="2"><xsl:apply-templates select="RUScat_ru:PersonId"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="catpi_ru:EqualIndicator">
			<tr>
				<td class="bordered" colspan="2">
					<xsl:choose>
						<xsl:when test="contains(local-name(.), 'ConsignorDetails')">Признак совпадения с продавцом/покупателем</xsl:when>
						<xsl:when test="contains(local-name(.), 'ConsigneeDetails')">Признак совпадения с продавцом/покупателем</xsl:when>
						<xsl:when test="contains(local-name(.), 'DeclarantDetails')">Признак совпадения лица, представившего предварительную информацию, с перевозчиком, осуществляющим ввоз товаров на таможенную территорию Евразийского экономического союза</xsl:when>
						<xsl:when test="contains(local-name(.), 'SellerDetails')">Признак совпадения с продавцом/покупателем</xsl:when>
						<xsl:when test="contains(local-name(.), 'BuyerDetails')">Признак совпадения с продавцом/покупателем</xsl:when>
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
		<xsl:if test="catpi_ru:ExchangePostOfficeCode">
			<tr>
				<td class="bordered" colspan="2">Кодовое обозначение учреждения обмена (подачи) международных почтовых отправлений</td>
				<td class="bordered" colspan="2"><xsl:apply-templates select="catpi_ru:ExchangePostOfficeCode"/></td>
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
				<td class="bordered part" colspan="4">Свидетельство о включении лица в реестр уполномоченных экономических операторов, таможенных перевозчиков или таможенных представителей</td>
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
				<xsl:apply-templates select="catpi_ru:CountryA2Code"/>
			</td>
			<td class="bordered">
				Рег. номер<br/>
				<xsl:apply-templates select="catpi_ru:RegistrationNumberId"/>
			</td>
			<td class="bordered">
				Признак перерегистрации<br/>
				<xsl:apply-templates select="catpi_ru:ReregistrationCode"/>
			</td>
			<td class="bordered">
				Код типа<br/>
				<xsl:apply-templates select="catpi_ru:AEORegistryKindCode"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="contacts">
		<tr>
			<td class="bordered">
				Телефон<br/>
				<xsl:for-each select="cat_ru:Phone">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				Факс<br/>
				<xsl:apply-templates select="cat_ru:Fax"/>
			</td>
			<td class="bordered">
				Телекс<br/>
				<xsl:apply-templates select="cat_ru:Telex"/>
			</td>
			<td class="bordered">
				E-mail<br/>
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:if test="position() &gt; 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<tr>
					<td class="bordered" colspan="4">
						<i><xsl:value-of select="position()"/></i>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="RUScat_ru:AddressText"/>
					</td>
				</tr>
			</xsl:when>
			<xsl:otherwise>
				<tr>
					<td class="bordered">
						<i><xsl:value-of select="position()"/></i>
						<br/>
						<xsl:choose>
							<xsl:when test="RUScat_ru:AddressKindCode=1">адрес регистрации</xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode=2">фактический адрес</xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode=3">почтовый адрес</xsl:when>
						</xsl:choose>
					</td>
					<td class="bordered">
						Индекс<br/>
						<xsl:apply-templates select="RUScat_ru:PostalCode"/>
					</td>
					<td class="bordered">
						Страна<br/>
						<xsl:apply-templates select="RUScat_ru:CountryCode"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="RUScat_ru:CounryName"/>
					</td>
					<td class="bordered">
						Регион<br/>
						<xsl:apply-templates select="RUScat_ru:Region"/>
					</td>
				</tr>
				<tr>
					<td class="bordered">
						Район<br/>
						<xsl:apply-templates select="RUScat_ru:District"/>
					</td>
					<td class="bordered">
						Город, населенный пункт<br/>
						<xsl:apply-templates select="RUScat_ru:Town"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="RUScat_ru:City"/>
					</td>
					<td class="bordered">
						Улица, дом, квартира<br/>
						<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="RUScat_ru:House"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="RUScat_ru:Room"/>
					</td>
					<td class="bordered">
						ОКАТО<br/>
						<xsl:apply-templates select="RUScat_ru:OKATO"/>
					</td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
		</xsl:template>
	
	<xsl:template match="*" mode="identityCard">
		<tr>
			<td class="bordered">Серия<br/>
				<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
			</td>
			<td class="bordered">Номер<br/>
				<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
			</td>
			<td class="bordered">Дата выдачи<br/>
				<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
			</td>
			<td class="bordered">Кем выдан<br/>
				<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="RUScat_ru:IssuerCode"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="comma">
		<xsl:for-each select="*">
			<xsl:if test="position() &gt; 1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="spaced">
		<xsl:for-each select="*">
			<xsl:if test="position() &gt; 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="autop:LoadingLocationDetails | autop:UnloadingLocationDetails">
		<xsl:if test="catpi_ru:LocationCode">
			<xsl:value-of select="catpi_ru:LocationCode"/>
		</xsl:if>
		<xsl:if test="catpi_ru:UnifiedCountryCode">
			<xsl:text> страна </xsl:text>
			<xsl:value-of select="catpi_ru:UnifiedCountryCode"/>
		</xsl:if>
		<xsl:if test="catpi_ru:PlaceName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="catpi_ru:PlaceName"/>
		</xsl:if>
		<xsl:if test="catpi_ru:RailwayStationCode">
			<xsl:text> ж/д </xsl:text>
			<xsl:value-of select="catpi_ru:RailwayStationCode"/>
		</xsl:if>
		<xsl:if test="catpi_ru:CustomsOfficeCode">
			<xsl:text> т/о </xsl:text>
			<xsl:value-of select="catpi_ru:CustomsOfficeCode"/>
		</xsl:if>
		<xsl:if test="catpi_ru:EventDate">
			<xsl:text> дата - </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="catpi_ru:EventDate"/></xsl:call-template>
		</xsl:if>
	</xsl:template>
	
		<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:apply-templates select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:apply-templates select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="cat_ru:RNN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures| RUScat_ru:KGOrganizationFeatures">
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
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures| RUScat_ru:RAOrganizationFeatures">
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
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures| RUScat_ru:RBOrganizationFeatures">
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
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures| RUScat_ru:RFOrganizationFeatures">
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
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures| RUScat_ru:RKOrganizationFeatures">
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
	
	<xsl:template match="autop:EntryCheckPointDetails">
		<tr>
			<td class="bordered" width="25%">
				Код ТО<br/>
				<xsl:apply-templates select="autop:CustomsOfficeCode"/>
			</td>
			<td class="bordered" width="25%">
				Код пункта пропуска<br/>
				<xsl:apply-templates select="autop:BorderCheckpointCode"/>
			</td>
			<td class="bordered" width="50%" colspan="2">
				Наименование пункта пропуска<br/>
				<xsl:apply-templates select="autop:BorderCheckpointName"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="regnum">
		<xsl:apply-templates select="catpi_ru:CountryCode|cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="catpi_ru:Date|cat_ru:RegistrationDate" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="catpi_ru:PINumber|cat_ru:GTDNumber"/>
	</xsl:template>
	
	<xsl:template name="num_date">
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
