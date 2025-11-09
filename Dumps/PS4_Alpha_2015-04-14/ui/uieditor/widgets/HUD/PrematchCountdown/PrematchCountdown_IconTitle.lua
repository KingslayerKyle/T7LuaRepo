require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_BeginsIn" )

CoD.PrematchCountdown_IconTitle = InheritFrom( LUI.UIElement )
CoD.PrematchCountdown_IconTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrematchCountdown_IconTitle )
	self.id = "PrematchCountdown_IconTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 284 )
	self:setTopBottom( true, false, 0, 183 )
	self.anyChildUsesUpdateState = true
	
	local GlowPanel = CoD.PrematchCountdown_IconGlowPanel.new( menu, controller )
	GlowPanel:setLeftRight( false, false, -142, 150.5 )
	GlowPanel:setTopBottom( true, false, -67.25, 225.25 )
	GlowPanel:setRGB( 1, 1, 1 )
	self:addElement( GlowPanel )
	self.GlowPanel = GlowPanel
	
	local ImageElement = LUI.UIImage.new()
	ImageElement:setLeftRight( false, false, -63, 65 )
	ImageElement:setTopBottom( true, false, 0, 128 )
	ImageElement:setRGB( 1, 1, 1 )
	ImageElement:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	ImageElement:subscribeToGlobalModel( controller, "Factions", "playerFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImageElement:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ImageElement )
	self.ImageElement = ImageElement
	
	local StringElement = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	StringElement:setLeftRight( false, false, -142, 142 )
	StringElement:setTopBottom( true, false, 150.29, 182.5 )
	StringElement:setRGB( 1, 1, 1 )
	StringElement.FEButtonPanel0:setRGB( 0, 0, 0 )
	StringElement.FEButtonPanel0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	StringElement.Glow:setRGB( 0.3, 0.23, 0.2 )
	StringElement.MatchText:setRGB( 0.96, 0.96, 1 )
	StringElement.MatchText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	StringElement.MatchText:setLetterSpacing( 1 )
	StringElement:subscribeToGlobalModel( controller, "Factions", "playerFactionDisplayName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StringElement.MatchText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( StringElement )
	self.StringElement = StringElement
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				self.clipFinished( GlowPanel, {} )
				ImageElement:completeAnimation()
				self.ImageElement:setAlpha( 0 )
				self.clipFinished( ImageElement, {} )
			end,
			Start = function ()
				self:setupElementClipCounter( 3 )
				local GlowPanelFrame2 = function ( GlowPanel, event )
					if not event.interrupted then
						GlowPanel:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					GlowPanel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( GlowPanel, event )
					else
						GlowPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				GlowPanelFrame2( GlowPanel, {} )
				local ImageElementFrame2 = function ( ImageElement, event )
					local ImageElementFrame3 = function ( ImageElement, event )
						if not event.interrupted then
							ImageElement:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
						end
						ImageElement:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ImageElement, event )
						else
							ImageElement:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ImageElementFrame3( ImageElement, event )
						return 
					else
						ImageElement:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						ImageElement:registerEventHandler( "transition_complete_keyframe", ImageElementFrame3 )
					end
				end
				
				ImageElement:completeAnimation()
				self.ImageElement:setAlpha( 0 )
				ImageElementFrame2( ImageElement, {} )
				local StringElementFrame2 = function ( StringElement, event )
					if not event.interrupted then
						StringElement:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					StringElement:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( StringElement, event )
					else
						StringElement:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StringElement:completeAnimation()
				self.StringElement:setAlpha( 0 )
				StringElementFrame2( StringElement, {} )
			end,
			Stop = function ()
				self:setupElementClipCounter( 3 )
				local GlowPanelFrame2 = function ( GlowPanel, event )
					if not event.interrupted then
						GlowPanel:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
					end
					GlowPanel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowPanel, event )
					else
						GlowPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 1 )
				GlowPanelFrame2( GlowPanel, {} )
				local ImageElementFrame2 = function ( ImageElement, event )
					if not event.interrupted then
						ImageElement:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Bounce )
					end
					ImageElement:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImageElement, event )
					else
						ImageElement:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImageElement:completeAnimation()
				self.ImageElement:setAlpha( 1 )
				ImageElementFrame2( ImageElement, {} )
				local StringElementFrame2 = function ( StringElement, event )
					local StringElementFrame3 = function ( StringElement, event )
						if not event.interrupted then
							StringElement:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Bounce )
						end
						StringElement:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( StringElement, event )
						else
							StringElement:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						StringElementFrame3( StringElement, event )
						return 
					else
						StringElement:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						StringElement:registerEventHandler( "transition_complete_keyframe", StringElementFrame3 )
					end
				end
				
				StringElement:completeAnimation()
				self.StringElement:setAlpha( 1 )
				StringElementFrame2( StringElement, {} )
			end
		}
	}
	self.close = function ( self )
		self.GlowPanel:close()
		self.StringElement:close()
		self.ImageElement:close()
		CoD.PrematchCountdown_IconTitle.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

