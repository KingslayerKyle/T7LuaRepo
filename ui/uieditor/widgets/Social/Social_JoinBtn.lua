-- 72338a2fdf084a0223ea5969fff809ce
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Social.JoinButtonPrompt" )

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		self:setHandleMouse( true )
	end
end

CoD.Social_JoinBtn = InheritFrom( LUI.UIElement )
CoD.Social_JoinBtn.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Social_JoinBtn )
	self.id = "Social_JoinBtn"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 26 )
	self.anyChildUsesUpdateState = true
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( true, false, 196, 200 )
	spacer:setTopBottom( true, false, 0, 26 )
	spacer:setAlpha( 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local joinLabel = LUI.UITightText.new()
	joinLabel:setLeftRight( true, false, 168, 200 )
	joinLabel:setTopBottom( true, false, 4, 24 )
	joinLabel:setText( Engine.Localize( "MENU_JOIN_SERVER_CAPS" ) )
	joinLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( joinLabel )
	self.joinLabel = joinLabel
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 164, 168 )
	Image0:setTopBottom( true, false, 6, 20 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local JoinButtonPrompt = CoD.JoinButtonPrompt.new( menu, controller )
	JoinButtonPrompt:setLeftRight( true, false, 138, 164 )
	JoinButtonPrompt:setTopBottom( true, false, 0, 26 )
	JoinButtonPrompt.KMprompt:setText( Engine.Localize( "J" ) )
	JoinButtonPrompt:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			JoinButtonPrompt.GpadButtonImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( JoinButtonPrompt )
	self.JoinButtonPrompt = JoinButtonPrompt
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				joinLabel:completeAnimation()
				self.joinLabel:setRGB( 1, 1, 1 )
				self.joinLabel:setAlpha( 1 )
				self.clipFinished( joinLabel, {} )

				JoinButtonPrompt:completeAnimation()
				self.JoinButtonPrompt:setAlpha( 1 )
				self.clipFinished( JoinButtonPrompt, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )

				joinLabel:completeAnimation()
				self.joinLabel:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( joinLabel, {} )
			end
		},
		NotJoinable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				joinLabel:completeAnimation()
				self.joinLabel:setAlpha( 0 )
				self.clipFinished( joinLabel, {} )

				JoinButtonPrompt:completeAnimation()
				self.JoinButtonPrompt:setAlpha( 0 )
				self.clipFinished( JoinButtonPrompt, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NotJoinable",
			condition = function ( menu, element, event )
				return not IsJoinable( self, controller )
			end
		}
	} )
	self:linkToElementModel( self, "joinable", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "joinable"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyLockedIn"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.JoinButtonPrompt:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
