require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderGlow" )

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
	self:setLeftRight( true, false, 0, 355 )
	self:setTopBottom( true, false, 0, 23 )
	
	local FEListSubHeaderGlow00 = CoD.FE_ListSubHeaderGlow.new( menu, controller )
	FEListSubHeaderGlow00:setLeftRight( true, true, 0, 0 )
	FEListSubHeaderGlow00:setTopBottom( true, true, 0, 0 )
	FEListSubHeaderGlow00:setRGB( 1, 1, 1 )
	self:addElement( FEListSubHeaderGlow00 )
	self.FEListSubHeaderGlow00 = FEListSubHeaderGlow00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FEListSubHeaderGlow00:completeAnimation()
				self.FEListSubHeaderGlow00:setAlpha( 1 )
				self.clipFinished( FEListSubHeaderGlow00, {} )
			end,
			Invisible = function ()
				self:setupElementClipCounter( 1 )
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
				self:setupElementClipCounter( 1 )
				FEListSubHeaderGlow00:completeAnimation()
				self.FEListSubHeaderGlow00:setAlpha( 0 )
				self.clipFinished( FEListSubHeaderGlow00, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
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
	self.close = function ( self )
		self.FEListSubHeaderGlow00:close()
		CoD.MapVoteHeader.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

