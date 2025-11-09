require( "ui.uieditor.widgets.Groups.GroupMemberSummary" )
require( "ui.uieditor.widgets.Groups.GroupLevel" )
require( "ui.uieditor.widgets.Groups.GroupsSummaryStatus" )
require( "ui.uieditor.widgets.Groups.GroupsSummaryTBD" )
require( "ui.uieditor.widgets.BorderBakedStroke" )
require( "ui.uieditor.widgets.Groups.GroupEmblemWidget" )

CoD.GroupsSummary = InheritFrom( LUI.UIElement )
CoD.GroupsSummary.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.GroupsSummary )
	self.id = "GroupsSummary"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 460 )
	self.anyChildUsesUpdateState = true
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( true, true, 0, 0 )
	Backing:setTopBottom( true, true, 0, 0 )
	Backing:setAlpha( 0.05 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 14, 334 )
	Image1:setTopBottom( true, false, 354.5, 377.5 )
	Image1:setAlpha( 0.1 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local GroupMemberSummary = CoD.GroupMemberSummary.new( menu, controller )
	GroupMemberSummary:setLeftRight( true, false, 14, 334 )
	GroupMemberSummary:setTopBottom( true, false, 380.5, 445.5 )
	GroupMemberSummary.MemberCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_MEMBERS" ) ) )
	GroupMemberSummary.PlayingCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_PLAYING" ) ) )
	GroupMemberSummary.OnlineCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_ONLINE" ) ) )
	GroupMemberSummary:linkToElementModel( self, "memberCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupMemberSummary.MemberCount.Count:setText( Engine.Localize( modelValue ) )
		end
	end )
	GroupMemberSummary:linkToElementModel( self, "inTitleCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupMemberSummary.PlayingCount.Count:setText( Engine.Localize( modelValue ) )
		end
	end )
	GroupMemberSummary:linkToElementModel( self, "onlineCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupMemberSummary.OnlineCount.Count:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GroupMemberSummary )
	self.GroupMemberSummary = GroupMemberSummary
	
	local GroupLevelWidget = CoD.GroupLevel.new( menu, controller )
	GroupLevelWidget:setLeftRight( true, false, 198, 346 )
	GroupLevelWidget:setTopBottom( true, false, 464, 515 )
	GroupLevelWidget:setAlpha( 0 )
	self:addElement( GroupLevelWidget )
	self.GroupLevelWidget = GroupLevelWidget
	
	local GroupName = LUI.UITightText.new()
	GroupName:setLeftRight( true, false, 16, 164 )
	GroupName:setTopBottom( true, false, 194, 224 )
	GroupName:setRGB( 0.87, 0.88, 0.78 )
	GroupName:setTTF( "fonts/escom.ttf" )
	GroupName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupName:setText( modelValue )
		end
	end )
	self:addElement( GroupName )
	self.GroupName = GroupName
	
	local Owner = LUI.UITightText.new()
	Owner:setLeftRight( true, false, 361, 403 )
	Owner:setTopBottom( true, false, 249.5, 265.5 )
	Owner:setRGB( 0.5, 0.51, 0.52 )
	Owner:setAlpha( 0 )
	Owner:setText( Engine.Localize( "GROUPS_OWNER" ) )
	Owner:setTTF( "fonts/UnitedSansRgMd.ttf" )
	self:addElement( Owner )
	self.Owner = Owner
	
	local OwnerName = LUI.UIText.new()
	OwnerName:setLeftRight( true, false, 503.75, 681 )
	OwnerName:setTopBottom( true, false, 249.5, 265.5 )
	OwnerName:setAlpha( 0 )
	OwnerName:setTTF( "fonts/UnitedSansRgMd.ttf" )
	OwnerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	OwnerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	OwnerName:linkToElementModel( self, "owner", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			OwnerName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( OwnerName )
	self.OwnerName = OwnerName
	
	local GroupDescription = LUI.UIText.new()
	GroupDescription:setLeftRight( true, false, 16, 336 )
	GroupDescription:setTopBottom( true, false, 269, 290 )
	GroupDescription:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	GroupDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GroupDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GroupDescription:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GroupDescription )
	self.GroupDescription = GroupDescription
	
	local GroupLevel = LUI.UITightText.new()
	GroupLevel:setLeftRight( true, false, 17, 125 )
	GroupLevel:setTopBottom( true, false, 477, 502 )
	GroupLevel:setRGB( 0.5, 0.51, 0.52 )
	GroupLevel:setAlpha( 0 )
	GroupLevel:setText( Engine.Localize( "GROUPS_GROUP_LEVEL" ) )
	GroupLevel:setTTF( "fonts/default.ttf" )
	self:addElement( GroupLevel )
	self.GroupLevel = GroupLevel
	
	local Country = LUI.UITightText.new()
	Country:setLeftRight( true, false, 361, 414 )
	Country:setTopBottom( true, false, 223, 239 )
	Country:setRGB( 0.5, 0.51, 0.52 )
	Country:setAlpha( 0 )
	Country:setText( Engine.Localize( "GROUPS_COUNTRY" ) )
	Country:setTTF( "fonts/UnitedSansRgMd.ttf" )
	self:addElement( Country )
	self.Country = Country
	
	local CountryName = LUI.UIText.new()
	CountryName:setLeftRight( true, false, 503.75, 681 )
	CountryName:setTopBottom( true, false, 223, 239 )
	CountryName:setAlpha( 0 )
	CountryName:setText( Engine.Localize( "GROUPS_UNITED_STATES" ) )
	CountryName:setTTF( "fonts/UnitedSansRgMd.ttf" )
	CountryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CountryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CountryName )
	self.CountryName = CountryName
	
	local Language = LUI.UITightText.new()
	Language:setLeftRight( true, false, 17, 72 )
	Language:setTopBottom( true, false, 358.5, 374.5 )
	Language:setRGB( 0.5, 0.51, 0.52 )
	Language:setText( Engine.Localize( "GROUPS_LANGUAGE" ) )
	Language:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Language )
	self.Language = Language
	
	local LanguageName = LUI.UIText.new()
	LanguageName:setLeftRight( true, false, 79, 256.25 )
	LanguageName:setTopBottom( true, false, 358.5, 374.5 )
	LanguageName:setText( Engine.Localize( "GROUPS_ENGLISH" ) )
	LanguageName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	LanguageName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	LanguageName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LanguageName )
	self.LanguageName = LanguageName
	
	local GroupsSummaryStatus0 = CoD.GroupsSummaryStatus.new( menu, controller )
	GroupsSummaryStatus0:setLeftRight( true, false, 16, 336 )
	GroupsSummaryStatus0:setTopBottom( true, false, 235.5, 252.5 )
	GroupsSummaryStatus0:linkToElementModel( self, nil, false, function ( model )
		GroupsSummaryStatus0:setModel( model, controller )
	end )
	self:addElement( GroupsSummaryStatus0 )
	self.GroupsSummaryStatus0 = GroupsSummaryStatus0
	
	local GroupClanTag = LUI.UIText.new()
	GroupClanTag:setLeftRight( true, false, 361, 453.5 )
	GroupClanTag:setTopBottom( true, false, 287, 307 )
	GroupClanTag:setRGB( 0, 0, 0 )
	GroupClanTag:setAlpha( 0 )
	GroupClanTag:setTTF( "fonts/UnitedSansRgMd.ttf" )
	GroupClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GroupClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GroupClanTag:linkToElementModel( self, "clanTag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupClanTag:setText( modelValue )
		end
	end )
	self:addElement( GroupClanTag )
	self.GroupClanTag = GroupClanTag
	
	local Line1 = LUI.UIImage.new()
	Line1:setLeftRight( true, false, 14, 334 )
	Line1:setTopBottom( true, false, 228.5, 232.5 )
	Line1:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlineforeh" ) )
	Line1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line1 )
	self.Line1 = Line1
	
	local Line2 = LUI.UIImage.new()
	Line2:setLeftRight( true, false, 14, 334 )
	Line2:setTopBottom( true, false, 255.5, 259.5 )
	Line2:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlineforeh" ) )
	Line2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line2 )
	self.Line2 = Line2
	
	local GroupsSummaryTBD0 = CoD.GroupsSummaryTBD.new( menu, controller )
	GroupsSummaryTBD0:setLeftRight( true, false, 103, 249 )
	GroupsSummaryTBD0:setTopBottom( true, false, 159, 287 )
	GroupsSummaryTBD0:setAlpha( 0 )
	self:addElement( GroupsSummaryTBD0 )
	self.GroupsSummaryTBD0 = GroupsSummaryTBD0
	
	local CountryFlagImage = LUI.UIImage.new()
	CountryFlagImage:setLeftRight( true, false, 300, 332 )
	CountryFlagImage:setTopBottom( true, false, 354.5, 377.5 )
	CountryFlagImage:setImage( RegisterImage( "uie_img_t7_menu_groups_flag_us" ) )
	self:addElement( CountryFlagImage )
	self.CountryFlagImage = CountryFlagImage
	
	local BorderBakedStroke0 = CoD.BorderBakedStroke.new( menu, controller )
	BorderBakedStroke0:setLeftRight( true, false, 14, 334 )
	BorderBakedStroke0:setTopBottom( true, false, 12, 190 )
	self:addElement( BorderBakedStroke0 )
	self.BorderBakedStroke0 = BorderBakedStroke0
	
	local GroupEmblemWidget = CoD.GroupEmblemWidget.new( menu, controller )
	GroupEmblemWidget:setLeftRight( true, false, 104, 244 )
	GroupEmblemWidget:setTopBottom( true, false, 28, 168 )
	GroupEmblemWidget:linkToElementModel( self, nil, false, function ( model )
		GroupEmblemWidget:setModel( model, controller )
	end )
	GroupEmblemWidget:linkToElementModel( self, "groupId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupEmblemWidget.GroupEmblem:setupGroupEmblem( modelValue )
		end
	end )
	self:addElement( GroupEmblemWidget )
	self.GroupEmblemWidget = GroupEmblemWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				Backing:completeAnimation()
				self.Backing:setAlpha( 0.05 )
				self.clipFinished( Backing, {} )
				Image1:completeAnimation()
				self.Image1:setLeftRight( true, false, 14, 334 )
				self.Image1:setTopBottom( true, false, 354.5, 377.5 )
				self.Image1:setAlpha( 0.1 )
				self.clipFinished( Image1, {} )
				GroupMemberSummary:completeAnimation()
				self.GroupMemberSummary:setAlpha( 1 )
				self.clipFinished( GroupMemberSummary, {} )
				GroupLevelWidget:completeAnimation()
				self.GroupLevelWidget:setLeftRight( true, false, 198, 346 )
				self.GroupLevelWidget:setTopBottom( true, false, 464, 515 )
				self.GroupLevelWidget:setAlpha( 0 )
				self.clipFinished( GroupLevelWidget, {} )
				GroupName:completeAnimation()
				self.GroupName:setLeftRight( true, false, 16, 164 )
				self.GroupName:setTopBottom( true, false, 194, 224 )
				self.GroupName:setAlpha( 1 )
				self.clipFinished( GroupName, {} )
				Owner:completeAnimation()
				self.Owner:setLeftRight( true, false, 361, 403 )
				self.Owner:setTopBottom( true, false, 249.5, 265.5 )
				self.Owner:setAlpha( 0 )
				self.clipFinished( Owner, {} )
				OwnerName:completeAnimation()
				self.OwnerName:setLeftRight( true, false, 503.75, 681 )
				self.OwnerName:setTopBottom( true, false, 249.5, 265.5 )
				self.OwnerName:setAlpha( 0 )
				self.clipFinished( OwnerName, {} )
				GroupDescription:completeAnimation()
				self.GroupDescription:setLeftRight( true, false, 16, 336 )
				self.GroupDescription:setTopBottom( true, false, 269, 290 )
				self.GroupDescription:setAlpha( 1 )
				self.clipFinished( GroupDescription, {} )
				Country:completeAnimation()
				self.Country:setLeftRight( true, false, 361, 414 )
				self.Country:setTopBottom( true, false, 223, 239 )
				self.Country:setAlpha( 0 )
				self.clipFinished( Country, {} )
				CountryName:completeAnimation()
				self.CountryName:setLeftRight( true, false, 503.75, 681 )
				self.CountryName:setTopBottom( true, false, 223, 239 )
				self.CountryName:setAlpha( 0 )
				self.clipFinished( CountryName, {} )
				Language:completeAnimation()
				self.Language:setLeftRight( true, false, 17, 72 )
				self.Language:setTopBottom( true, false, 358.5, 374.5 )
				self.Language:setAlpha( 1 )
				self.Language:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
				self.clipFinished( Language, {} )
				LanguageName:completeAnimation()
				self.LanguageName:setLeftRight( true, false, 79, 256.25 )
				self.LanguageName:setTopBottom( true, false, 358.5, 374.5 )
				self.LanguageName:setAlpha( 1 )
				self.LanguageName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
				self.clipFinished( LanguageName, {} )
				GroupsSummaryStatus0:completeAnimation()
				self.GroupsSummaryStatus0:setLeftRight( true, false, 16, 336 )
				self.GroupsSummaryStatus0:setTopBottom( true, false, 235.5, 252.5 )
				self.GroupsSummaryStatus0:setAlpha( 1 )
				self.clipFinished( GroupsSummaryStatus0, {} )
				GroupClanTag:completeAnimation()
				self.GroupClanTag:setLeftRight( true, false, 361, 453.5 )
				self.GroupClanTag:setTopBottom( true, false, 287, 307 )
				self.GroupClanTag:setAlpha( 0 )
				self.clipFinished( GroupClanTag, {} )
				Line1:completeAnimation()
				self.Line1:setLeftRight( true, false, 14, 334 )
				self.Line1:setTopBottom( true, false, 228.5, 232.5 )
				self.Line1:setAlpha( 1 )
				self.clipFinished( Line1, {} )
				Line2:completeAnimation()
				self.Line2:setAlpha( 1 )
				self.clipFinished( Line2, {} )
				GroupsSummaryTBD0:completeAnimation()
				self.GroupsSummaryTBD0:setAlpha( 0 )
				self.clipFinished( GroupsSummaryTBD0, {} )
				CountryFlagImage:completeAnimation()
				self.CountryFlagImage:setLeftRight( true, false, 300, 332 )
				self.CountryFlagImage:setTopBottom( true, false, 354.5, 377.5 )
				self.CountryFlagImage:setAlpha( 1 )
				self.clipFinished( CountryFlagImage, {} )
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 1 )
				self.clipFinished( BorderBakedStroke0, {} )
				GroupEmblemWidget:completeAnimation()
				self.GroupEmblemWidget:setAlpha( 1 )
				self.clipFinished( GroupEmblemWidget, {} )
			end
		},
		NoGroupSelected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )
				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )
				GroupMemberSummary:completeAnimation()
				self.GroupMemberSummary:setAlpha( 0 )
				self.clipFinished( GroupMemberSummary, {} )
				GroupName:completeAnimation()
				self.GroupName:setAlpha( 0 )
				self.clipFinished( GroupName, {} )
				Owner:completeAnimation()
				self.Owner:setAlpha( 0 )
				self.clipFinished( Owner, {} )
				OwnerName:completeAnimation()
				self.OwnerName:setAlpha( 0 )
				self.clipFinished( OwnerName, {} )
				GroupDescription:completeAnimation()
				self.GroupDescription:setAlpha( 0 )
				self.clipFinished( GroupDescription, {} )
				Country:completeAnimation()
				self.Country:setAlpha( 0 )
				self.clipFinished( Country, {} )
				CountryName:completeAnimation()
				self.CountryName:setAlpha( 0 )
				self.clipFinished( CountryName, {} )
				Language:completeAnimation()
				self.Language:setAlpha( 0 )
				self.clipFinished( Language, {} )
				LanguageName:completeAnimation()
				self.LanguageName:setAlpha( 0 )
				self.clipFinished( LanguageName, {} )
				GroupsSummaryStatus0:completeAnimation()
				self.GroupsSummaryStatus0:setAlpha( 0 )
				self.clipFinished( GroupsSummaryStatus0, {} )
				GroupClanTag:completeAnimation()
				self.GroupClanTag:setAlpha( 0 )
				self.clipFinished( GroupClanTag, {} )
				Line1:completeAnimation()
				self.Line1:setAlpha( 0 )
				self.clipFinished( Line1, {} )
				Line2:completeAnimation()
				self.Line2:setAlpha( 0 )
				self.clipFinished( Line2, {} )
				GroupsSummaryTBD0:completeAnimation()
				self.GroupsSummaryTBD0:setAlpha( 1 )
				self.clipFinished( GroupsSummaryTBD0, {} )
				CountryFlagImage:completeAnimation()
				self.CountryFlagImage:setAlpha( 0 )
				self.clipFinished( CountryFlagImage, {} )
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 0 )
				self.clipFinished( BorderBakedStroke0, {} )
				GroupEmblemWidget:completeAnimation()
				self.GroupEmblemWidget:setAlpha( 0 )
				self.clipFinished( GroupEmblemWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoGroupSelected",
			condition = function ( menu, element, event )
				return not HasSelectedGroup( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "groupId", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groupId"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupMemberSummary:close()
		self.GroupLevelWidget:close()
		self.GroupsSummaryStatus0:close()
		self.GroupsSummaryTBD0:close()
		self.BorderBakedStroke0:close()
		self.GroupEmblemWidget:close()
		self.GroupName:close()
		self.OwnerName:close()
		self.GroupDescription:close()
		self.GroupClanTag:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

