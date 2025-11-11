require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderGlow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanelContainer" )

CoD.MapVoteHeader = InheritFrom( LUI.UIElement )
CoD.MapVoteHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MapVoteHeader )
	self.id = "MapVoteHeader"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 532 )
	self:setTopBottom( 0, 0, 0, 34 )
	self.anyChildUsesUpdateState = true
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 0, 0 )
	FEMemberBlurPanelContainer0:setTopBottom( 0, 1, 0, 0 )
	FEMemberBlurPanelContainer0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local FEListSubHeaderGlow00 = CoD.FE_ListSubHeaderGlow.new( menu, controller )
	FEListSubHeaderGlow00:setLeftRight( 0, 1, 0, 0 )
	FEListSubHeaderGlow00:setTopBottom( 0, 1, 0, 0 )
	self:addElement( FEListSubHeaderGlow00 )
	self.FEListSubHeaderGlow00 = FEListSubHeaderGlow00
	
	self.resetProperties = function ()
		FEListSubHeaderGlow00:completeAnimation()
		FEMemberBlurPanelContainer0:completeAnimation()
		FEListSubHeaderGlow00:setAlpha( 1 )
		FEMemberBlurPanelContainer0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Invisible = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Bounce )
					end
					FEMemberBlurPanelContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local FEListSubHeaderGlow00Frame2 = function ( FEListSubHeaderGlow00, event )
					if not event.interrupted then
						FEListSubHeaderGlow00:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Bounce )
					end
					FEListSubHeaderGlow00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEListSubHeaderGlow00, event )
					else
						FEListSubHeaderGlow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEListSubHeaderGlow00:completeAnimation()
				self.FEListSubHeaderGlow00:setAlpha( 1 )
				FEListSubHeaderGlow00Frame2( FEListSubHeaderGlow00, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				FEListSubHeaderGlow00:completeAnimation()
				self.FEListSubHeaderGlow00:setAlpha( 0 )
				self.clipFinished( FEListSubHeaderGlow00, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Bounce )
					end
					FEMemberBlurPanelContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local FEListSubHeaderGlow00Frame2 = function ( FEListSubHeaderGlow00, event )
					if not event.interrupted then
						FEListSubHeaderGlow00:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Bounce )
					end
					FEListSubHeaderGlow00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEListSubHeaderGlow00, event )
					else
						FEListSubHeaderGlow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEListSubHeaderGlow00:completeAnimation()
				self.FEListSubHeaderGlow00:setAlpha( 0 )
				FEListSubHeaderGlow00Frame2( FEListSubHeaderGlow00, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueNonEmptyString( element, controller, "lobbyRoot.lobbyStatus" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatus" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyStatus"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEMemberBlurPanelContainer0:close()
		self.FEListSubHeaderGlow00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

