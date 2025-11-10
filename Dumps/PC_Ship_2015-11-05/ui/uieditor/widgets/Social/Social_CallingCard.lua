require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Social.Social_CallingCardTitle" )
require( "ui.uieditor.widgets.Social.Social_CallingCardSubTitle" )

CoD.Social_CallingCard = InheritFrom( LUI.UIElement )
CoD.Social_CallingCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_CallingCard )
	self.id = "Social_CallingCard"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 304 )
	self:setTopBottom( true, false, 0, 75 )
	self.anyChildUsesUpdateState = true
	
	local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget:setLeftRight( false, false, -4, 0 )
	CallingCardsFrameWidget:setTopBottom( false, false, 0, 0 )
	CallingCardsFrameWidget.CardIconFrame:setScale( 0.63 )
	CallingCardsFrameWidget:linkToElementModel( self, nil, false, function ( model )
		CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( CallingCardsFrameWidget )
	self.CallingCardsFrameWidget = CallingCardsFrameWidget
	
	local SocialCallingCardTitle = CoD.Social_CallingCardTitle.new( menu, controller )
	SocialCallingCardTitle:setLeftRight( true, false, 1, 300 )
	SocialCallingCardTitle:setTopBottom( true, false, 7, 32 )
	SocialCallingCardTitle.FEListSubHeaderPanel0:setAlpha( 0.65 )
	SocialCallingCardTitle.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SocialCallingCardTitle:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			SocialCallingCardTitle.Label0:setText( Engine.Localize( gamertag ) )
		end
	end )
	SocialCallingCardTitle:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:addElement( SocialCallingCardTitle )
	self.SocialCallingCardTitle = SocialCallingCardTitle
	
	local SocialCallingCardSubTitle = CoD.Social_CallingCardSubTitle.new( menu, controller )
	SocialCallingCardSubTitle:setLeftRight( true, false, 1, 300 )
	SocialCallingCardSubTitle:setTopBottom( true, false, 32, 52 )
	SocialCallingCardSubTitle.FEListSubHeaderPanel0:setAlpha( 0.65 )
	SocialCallingCardSubTitle.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SocialCallingCardSubTitle:linkToElementModel( self, "clantag", true, function ( model )
		local clantag = Engine.GetModelValue( model )
		if clantag then
			SocialCallingCardSubTitle:setAlpha( HideIfEmptyString( clantag ) )
		end
	end )
	SocialCallingCardSubTitle:linkToElementModel( self, "clantag", true, function ( model )
		local clantag = Engine.GetModelValue( model )
		if clantag then
			SocialCallingCardSubTitle.Label0:setText( StringAsClanTag( clantag ) )
		end
	end )
	SocialCallingCardSubTitle:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( SocialCallingCardSubTitle )
	self.SocialCallingCardSubTitle = SocialCallingCardSubTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				SocialCallingCardTitle:completeAnimation()
				self.SocialCallingCardTitle:setLeftRight( true, false, 1, 300 )
				self.SocialCallingCardTitle:setTopBottom( true, false, 7, 32 )
				self.SocialCallingCardTitle:setAlpha( 1 )
				self.clipFinished( SocialCallingCardTitle, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsFrameWidget:close()
		element.SocialCallingCardTitle:close()
		element.SocialCallingCardSubTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

