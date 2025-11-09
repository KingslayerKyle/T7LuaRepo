local PostLoadFunc = function ( self )
	local blackHatProgressModel = Engine.CreateModel( DataSources.Equipment.getModel( self.m_ownerController ), "blackHatHackProgress" )
	self:subscribeToModel( blackHatProgressModel, function ( model )
		local hackingProgress = Engine.GetModelValue( model )
		if hackingProgress then
			if hackingProgress > 0 then
				self.ProgressBar:setShaderVector( 0, hackingProgress, 0, 0, 0 )
				self.Status:setText( Engine.Localize( "MP_PDA_HACKING" ) )
				self.ProgressContainer:setAlpha( 1 )
				self.ProgressBar:setAlpha( 1 )
			else
				self.ProgressBar:setShaderVector( 0, 0, 0, 0, 0 )
				self.Status:setText( Engine.Localize( "MP_PDA_SEARCHING" ) )
				self.ProgressContainer:setAlpha( 0 )
				self.ProgressBar:setAlpha( 0 )
			end
		end
	end )
end

CoD.BlackHat_Internal = InheritFrom( LUI.UIElement )
CoD.BlackHat_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BlackHat_Internal )
	self.id = "BlackHat_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 256 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 128 )
	Background:setTopBottom( true, false, 0, 256 )
	Background:setRGB( 1, 1, 1 )
	Background:setAlpha( 0.58 )
	Background:setImage( RegisterImage( "uie_mtl_t6_wpn_pda_screen_holo" ) )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Background )
	self.Background = Background
	
	local Sweeps = LUI.UIImage.new()
	Sweeps:setLeftRight( true, false, 0, 128 )
	Sweeps:setTopBottom( true, false, 256, 384 )
	Sweeps:setRGB( 1, 1, 1 )
	Sweeps:setZRot( -90 )
	Sweeps:setImage( RegisterImage( "uie_mtl_t6_wpn_pda_screen_wave" ) )
	Sweeps:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Sweeps )
	self.Sweeps = Sweeps
	
	local Beeps = LUI.UIText.new()
	Beeps:setLeftRight( true, false, 101.5, 127 )
	Beeps:setTopBottom( true, false, 95, 114 )
	Beeps:setRGB( 1, 0.41, 0 )
	Beeps:setText( Engine.Localize( "." ) )
	Beeps:setTTF( "fonts/default.ttf" )
	Beeps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Beeps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Beeps )
	self.Beeps = Beeps
	
	local Status = LUI.UIText.new()
	Status:setLeftRight( true, false, 0, 101.5 )
	Status:setTopBottom( true, false, 95, 114 )
	Status:setRGB( 1, 0.41, 0 )
	Status:setText( Engine.Localize( "MP_PDA_SEARCHING" ) )
	Status:setTTF( "fonts/default.ttf" )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Status )
	self.Status = Status
	
	local ProgressContainer = LUI.UIImage.new()
	ProgressContainer:setLeftRight( true, false, 0, 128 )
	ProgressContainer:setTopBottom( true, false, 114, 178 )
	ProgressContainer:setRGB( 1, 1, 1 )
	ProgressContainer:setImage( RegisterImage( "uie_mtl_t6_wpn_pda_progressbar_border" ) )
	ProgressContainer:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ProgressContainer )
	self.ProgressContainer = ProgressContainer
	
	local ProgressBar = LUI.UIImage.new()
	ProgressBar:setLeftRight( true, false, 0, 128 )
	ProgressBar:setTopBottom( true, false, 114, 178 )
	ProgressBar:setRGB( 1, 1, 1 )
	ProgressBar:setImage( RegisterImage( "uie_mtl_t6_wpn_pda_progressbar_solid" ) )
	ProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ProgressBar:setShaderVector( 0, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local SweepsFrame2 = function ( Sweeps, event )
					if not event.interrupted then
						Sweeps:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
					end
					Sweeps:setLeftRight( true, false, 0, 128 )
					Sweeps:setTopBottom( true, false, -128, 0 )
					if event.interrupted then
						self.clipFinished( Sweeps, event )
					else
						Sweeps:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Sweeps:completeAnimation()
				self.Sweeps:setLeftRight( true, false, 0, 128 )
				self.Sweeps:setTopBottom( true, false, 256, 384 )
				SweepsFrame2( Sweeps, {} )
				local BeepsFrame2 = function ( Beeps, event )
					local BeepsFrame3 = function ( Beeps, event )
						local BeepsFrame4 = function ( Beeps, event )
							if not event.interrupted then
								Beeps:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Linear )
							end
							Beeps:setText( Engine.Localize( "..." ) )
							if event.interrupted then
								self.clipFinished( Beeps, event )
							else
								Beeps:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BeepsFrame4( Beeps, event )
							return 
						else
							Beeps:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
							Beeps:setText( Engine.Localize( ".." ) )
							Beeps:registerEventHandler( "transition_complete_keyframe", BeepsFrame4 )
						end
					end
					
					if event.interrupted then
						BeepsFrame3( Beeps, event )
						return 
					else
						Beeps:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
						Beeps:registerEventHandler( "transition_complete_keyframe", BeepsFrame3 )
					end
				end
				
				Beeps:completeAnimation()
				self.Beeps:setText( Engine.Localize( "." ) )
				BeepsFrame2( Beeps, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

